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
        activityList = entity
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
                    case .student:
                        return try await fetchActivityListByStudent()

                    default:
                        return try await fetchActivityListByID()
                    }
                }()

                updateContent(entity: studentActivityList)
                isLoading = false
            } catch {
                errorMessage = error.activityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func fetchActivityListByStudent() async throws -> ActivityContentEntity {
        return try await fetchMyActivityUseCase()
    }

    func fetchActivityListByID() async throws -> ActivityContentEntity {
        return try await fetchActivityByIDUseCase(studentID: studentID)
    }
}
