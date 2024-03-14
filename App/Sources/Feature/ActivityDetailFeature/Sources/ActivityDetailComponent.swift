import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityDetailDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchActivityDetailsUseCase: any FetchActivityDetailsUseCase { get }
    var deleteActivityUseCase: any DeleteActivityUseCase { get }
}

public final class ActivityDetailComponent: Component<ActivityDetailDependency>, ActivityDetailFactory {
    @MainActor
    public func makeView(activityID: String) -> some View {
        ActivityDetailView(
            viewModel: .init(
                activityID: activityID,
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                fetchActivityDetailsUseCase: self.dependency.fetchActivityDetailsUseCase,
                deleteActivityUseCase: self.dependency.deleteActivityUseCase
            )
        )
    }
}
