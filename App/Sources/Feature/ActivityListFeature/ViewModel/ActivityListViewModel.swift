import Foundation
import Service

final class ActivityListViewModel: BaseViewModel {
    @Published var isPresentedInputActivityView: Bool = false
    var model: ActivityListModel
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase
    private let queryStudentActivityListUseCase: any QueryStudentActivityListUseCase
    private let queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase
    private let studentID: UUID

    init(
        studentID: UUID,
        model: ActivityListModel,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase,
        queryStudentActivityListUseCase: any QueryStudentActivityListUseCase,
        queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase
    ) {
        self.studentID = studentID
        self.model = model
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryMyStudentActivityUseCase = queryMyStudentActivityUseCase
        self.queryStudentActivityListUseCase = queryStudentActivityListUseCase
        self.queryStudentActivityByIdUseCase = queryStudentActivityByIdUseCase
    }

    @MainActor
    func onAppear() {
        let authority = loadUserAuthorityUseCase()
        model.updateUserRole(authority: authority)

        Task {
            do {
                let studentActivityList: [ActivityEntity] = try await { () async throws -> [ActivityEntity] in
                    switch model.authority {
                    case .admin: return try await onAppearStudentListByAdmin()
                    case .student: return try await onAppearStudentListByStudent()
                    case .teacher: return try await onAppearStudentListByTeacher()
                    default:
                        throw ActivityDomainError.forbidden
                    }
                }()

                model.updateContent(entity: studentActivityList)
            } catch {
                if let activityDomainError = error as? ActivityDomainError {
                    model.errorMessage = activityDomainError.errorDescription ?? "알 수 없는 오류가 발생했습니다."
                } else {
                    model.errorMessage = "알 수 없는 오류가 발생했습니다."
                }
                self.isErrorOccurred = true

                print(error.localizedDescription)
            }
        }
    }

    func onAppearStudentListByAdmin() async throws -> [ActivityEntity] {
        return try await queryStudentActivityListUseCase()
    }

    func onAppearStudentListByStudent() async throws -> [ActivityEntity] {
        return try await queryMyStudentActivityUseCase()
    }

    func onAppearStudentListByTeacher() async throws -> [ActivityEntity] {
        return try await queryStudentActivityByIdUseCase(studentID: studentID.uuidString)
    }

    func toastDismissed() {
        self.isErrorOccurred = false
    }

    func inputActivityViewIsRequired() {
        self.isPresentedInputActivityView = true
    }

    func inputActivityViewIsDismissed() {
        self.isPresentedInputActivityView = false
    }
}
