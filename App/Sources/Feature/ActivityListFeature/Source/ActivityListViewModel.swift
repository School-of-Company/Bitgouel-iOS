import Foundation
import Service

final class ActivityListViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var activityList: ActivityContentEntity?
    @Published var activityID: String = ""
    @Published var isPresentedActivityDetailView: Bool = false
    @Published var isPresentedInputActivityView: Bool = false

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchMyActivityUseCase: any FetchMyActivityUseCase
    private let fetchActivityByIDUseCase: any FetchActivityByIDUseCase
    private let studentID: String

    init(
        studentID: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchMyActivityUseCase: any FetchMyActivityUseCase,
        fetchActivityByIDUseCase: any FetchActivityByIDUseCase
    ) {
        self.studentID = studentID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchMyActivityUseCase = fetchMyActivityUseCase
        self.fetchActivityByIDUseCase = fetchActivityByIDUseCase
    }

    func updateContent(entity: ActivityContentEntity) {
        self.activityList = entity
    }

    func updateIsErrorOccurred(state: Bool) {
        isErrorOccurred = state
    }

    func updateActivityID(activityID: String) {
        self.activityID = activityID
    }

    func updateIsPresentedActivityDetailView(isPresented: Bool) {
        isPresentedActivityDetailView = isPresented
    }

    func updateIsPresentedInputActivityView(isPresented: Bool) {
        isPresentedInputActivityView = isPresented
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        Task {
            do {
                let studentActivityList: ActivityContentEntity = try await { () async throws -> ActivityContentEntity in
                    switch authority {
                    case .admin,
                         .teacher:
                        return try await onAppearActivityList()

                    case .student: return try await onAppearActivityListByStudent()

                    default:
                        throw ActivityDomainError.forbidden
                    }
                }()

                updateContent(entity: studentActivityList)
                isLoading = false
            } catch {
                if let activityDomainError = error as? ActivityDomainError {
                    errorMessage = activityDomainError.errorDescription ?? "알 수 없는 오류가 발생했습니다."
                } else {
                    errorMessage = "알 수 없는 오류가 발생했습니다."
                }
                updateIsErrorOccurred(state: true)

                print(error.localizedDescription)
            }
        }
    }

    func onAppearActivityListByStudent() async throws -> ActivityContentEntity {
        return try await fetchMyActivityUseCase()
    }

    func onAppearActivityList() async throws -> ActivityContentEntity {
        return try await fetchActivityByIDUseCase(studentID: studentID)
    }
}
