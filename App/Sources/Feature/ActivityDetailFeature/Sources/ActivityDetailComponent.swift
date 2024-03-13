import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityDetailDependency: Dependency {
    var inputActivityFactory: any InputActivityFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchActivityDetailUseCase: any FetchActivityDetailUseCase { get }
    var deleteActivityUseCase: any DeleteActivityUseCase { get }
}

public final class ActivityDetailComponent: Component<ActivityDetailDependency>, ActivityDetailFactory {
    @MainActor
    public func makeView(activityID: String) -> some View {
        ActivityDetailView(
            viewModel: .init(
                activityID: activityID,
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                fetchActivityDetailUseCase: self.dependency.fetchActivityDetailUseCase,
                deleteActivityUseCase: self.dependency.deleteActivityUseCase
            ),
            inputActivityFactory: dependency.inputActivityFactory
        )
    }
}
