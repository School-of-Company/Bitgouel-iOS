import Foundation
import Service
import SwiftUI

@MainActor
final class ActivityDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isReject: Bool = false
    @Published var isApprove: Bool = false
    @Published var activityDetail: StudentActivityDetailEntity?

    private var activityID: String
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase
    private let approveStudentActivityUseCase: any ApproveStudentActivityUseCase
    private let rejectStudentActivityUseCase: any RejectStudentActivityUseCase
    private let deleteStudentActivityUseCase: any DeleteStudentActivityUseCase

    var statusColor: Color {
        guard let status = activityDetail?.approveStatus else { return .bitgouel(.greyscale(.g0)) }

        switch status {
        case .approve:
            return .bitgouel(.primary(.p5))
        case .pending:
            return .bitgouel(.error(.e5))
        }
    }

    init(
        activityID: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase,
        approveStudentActivityUseCase: any ApproveStudentActivityUseCase,
        rejectStudentActivityUseCase: any RejectStudentActivityUseCase,
        deleteStudentActivityUseCase: any DeleteStudentActivityUseCase
    ) {
        self.activityID = activityID
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
                activityDetail = try await queryStudentActivityDetailsUseCase(activityID: activityID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func deleteActivity() {
        Task {
            do {
                try await deleteStudentActivityUseCase(activityID: activityID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func rejectActivity() {
        Task {
            do {
                try await rejectStudentActivityUseCase(activityID: activityID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func approveActivity() {
        Task {
            do {
                try await approveStudentActivityUseCase(activityID: activityID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
