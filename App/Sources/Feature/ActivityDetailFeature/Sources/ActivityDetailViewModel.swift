import Foundation
import Service
import SwiftUI

@MainActor
final class ActivityDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var alertTitle: String = ""
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isReject: Bool = false
    @Published var isApprove: Bool = false
    @Published var activityDetail: StudentActivityDetailEntity?

    private var activityId: String
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase
    private let approveStudentActivityUseCase: any ApproveStudentActivityUseCase
    private let rejectStudentActivityUseCase: any RejectStudentActivityUseCase
    private let deleteStudentActivityUseCase: any DeleteStudentActivityUseCase

    init(
        activityId: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase,
        approveStudentActivityUseCase: any ApproveStudentActivityUseCase,
        rejectStudentActivityUseCase: any RejectStudentActivityUseCase,
        deleteStudentActivityUseCase: any DeleteStudentActivityUseCase
    ) {
        self.activityId = activityId
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryStudentActivityDetailsUseCase = queryStudentActivityDetailsUseCase
        self.approveStudentActivityUseCase = approveStudentActivityUseCase
        self.rejectStudentActivityUseCase = rejectStudentActivityUseCase
        self.deleteStudentActivityUseCase = deleteStudentActivityUseCase
    }

    func onAppear() {
        authority = loadUserAuthorityUseCase()
        print(authority)

        Task {
            do {
                activityDetail = try await queryStudentActivityDetailsUseCase(activityId: activityId)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func deleteActivity() {
        Task {
            do {
                try await deleteStudentActivityUseCase(activityId: activityId)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func rejectActivity() {
        Task {
            do {
                try await rejectStudentActivityUseCase(activityId: activityId)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func approveActivity() {
        Task {
            do {
                try await approveStudentActivityUseCase(activityId: activityId)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    var statusColor: Color {
        guard let status = activityDetail?.approveStatus else { return .bitgouel(.greyscale(.g0)) }

        switch status {
        case .approve:
            return .bitgouel(.primary(.p5))
        case .pending:
            return .bitgouel(.error(.e5))
        }
    }
}
