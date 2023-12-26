import Foundation
import Service

final class ActivityListViewModel: BaseViewModel {
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

        switch model.authority {
        case .admin:
            return onAppearStudentListByAdmin()
        case .student:
            return onAppearStudentListByStudent()
        case .teacher:
            return onAppearStudentListByTeacher()
        default:
            return
        }
    }

    func onAppearStudentListByAdmin() {
        Task {
            do {
                let activityListByAdmin = try await queryStudentActivityListUseCase()
                await model.updateContent(entity: activityListByAdmin)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func onAppearStudentListByStudent() {
        Task {
            do {
                let activityListByStudent = try await queryMyStudentActivityUseCase()
                await model.updateContent(entity: activityListByStudent)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func onAppearStudentListByTeacher() {
        Task {
            do {
                let activityListByTeacher = try await queryStudentActivityByIdUseCase(studentID: studentID.uuidString)
                await model.updateContent(entity: activityListByTeacher)
            }
        }
    }
}
