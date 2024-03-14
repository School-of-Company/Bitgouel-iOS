import Foundation
import Service

final class ActivityListViewModel: BaseViewModel {
    @Published var isPresentedInputActivityView: Bool = false
    
    var model: ActivityListModel
    
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchMyActivityUseCase: any FetchMyActivityUseCase
    private let fetchActivityListUseCase: any FetchActivityListUseCase
    private let fetchActivityByIDUseCase: any FetchActivityByIDUseCase
    private let studentID: String
    
    init(
        studentID: String,
        model: ActivityListModel,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchMyActivityUseCase: any FetchMyActivityUseCase,
        fetchActivityListUseCase: any FetchActivityListUseCase,
        fetchActivityByIDUseCase: any FetchActivityByIDUseCase
    ) {
        self.studentID = studentID
        self.model = model
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchMyActivityUseCase = fetchMyActivityUseCase
        self.fetchActivityListUseCase = fetchActivityListUseCase
        self.fetchActivityByIDUseCase = fetchActivityByIDUseCase
    }
    
    @MainActor
    func onAppear() {
        let authority = loadUserAuthorityUseCase()
        model.updateUserRole(authority: authority)
        
        Task {
            do {
                let studentActivityList: ActivityContentEntity = try await { () async throws -> ActivityContentEntity in
                    switch model.authority {
                    case .admin: return try await onAppearActivityListByAdmin()
                    case .student: return try await onAppearActivityListByStudent()
                    case .teacher: return try await onAppearActivityListByTeacher()
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
    
    func onAppearActivityListByAdmin() async throws -> ActivityContentEntity {
        return try await fetchActivityListUseCase()
    }
    
    func onAppearActivityListByStudent() async throws -> ActivityContentEntity {
        return try await fetchMyActivityUseCase()
    }
    
    func onAppearActivityListByTeacher() async throws -> ActivityContentEntity {
        return try await fetchActivityByIDUseCase(studentID: studentID)
    }
    
    func toastDismissed() {
        self.isErrorOccurred = false
    }
    
    @MainActor
    func activityDidSelect(activityID: String) {
        model.updateSelectedActivityID(activityID: activityID)
    }
    
    @MainActor
    func activityDetailPageDismissed() {
        model.isPresentedActivityDetailPage = false
    }
    
    func inputActivityViewIsRequired() {
        self.isPresentedInputActivityView = true
    }
    
    func inputActivityViewIsDismissed() {
        self.isPresentedInputActivityView = false
    }
}
