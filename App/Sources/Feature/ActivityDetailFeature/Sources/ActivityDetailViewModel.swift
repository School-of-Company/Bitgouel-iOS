import Foundation
import Service

final class ActivityDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var alertTitle: String = ""
    @Published var approveState: Bool?
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    private let userId: UUID
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase
    private let approveStudentActivityUseCase: any ApproveStudentActivityUseCase
    private let rejectStudentActivityUseCase: any RejectStudentActivityUseCase
    private let deleteStudentActivityUseCase: any DeleteStudentActivityUseCase
    
    init(
        userId: UUID,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase,
        approveStudentActivityUseCase: any ApproveStudentActivityUseCase,
        rejectStudentActivityUseCase: any RejectStudentActivityUseCase,
        deleteStudentActivityUseCase: any DeleteStudentActivityUseCase
    ) {
        self.userId = userId
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryStudentActivityDetailsUseCase = queryStudentActivityDetailsUseCase
        self.approveStudentActivityUseCase = approveStudentActivityUseCase
        self.rejectStudentActivityUseCase = rejectStudentActivityUseCase
        self.deleteStudentActivityUseCase = deleteStudentActivityUseCase
    }
    
    func deleteActivity() {
        Task {
            do {
                try await deleteStudentActivityUseCase(userID: userId.uuidString)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func rejectActivity() {
        Task {
            do {
                try await rejectStudentActivityUseCase(userID: userId.uuidString)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func approveActivity() {
        Task {
            do {
                try await approveStudentActivityUseCase(userID: userId.uuidString)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
