import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityDetailDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryStudentActivityDetailsUseCase: any QueryStudentActivityDetailsUseCase { get }
    var approveStudentActivityUseCase: any ApproveStudentActivityUseCase { get }
    var rejectStudentActivityUseCase: any RejectStudentActivityUseCase { get }
    var deleteStudentActivityUseCase: any DeleteStudentActivityUseCase { get }
}

public final class ActivityDetailComponent: Component<ActivityDetailDependency>, ActivityDetailFactory {
    @MainActor
    public func makeView(activityID: String) -> some View {
        ActivityDetailView(
            viewModel: .init(
                activityID: activityID,
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                queryStudentActivityDetailsUseCase: self.dependency.queryStudentActivityDetailsUseCase,
                approveStudentActivityUseCase: self.dependency.approveStudentActivityUseCase,
                rejectStudentActivityUseCase: self.dependency.rejectStudentActivityUseCase,
                deleteStudentActivityUseCase: self.dependency.deleteStudentActivityUseCase
            )
        )
    }
}
