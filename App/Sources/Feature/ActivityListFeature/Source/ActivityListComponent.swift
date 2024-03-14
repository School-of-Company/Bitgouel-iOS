import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityListDependency: Dependency {
    var activityDetailFactory: any ActivityDetailFactory { get }
    var inputActivityFactory: any InputActivityFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchMyActivityUseCase: any FetchMyActivityUseCase { get }
    var fetchActivityByIDUseCase: any FetchActivityByIDUseCase { get }
}

public final class ActivityListComponent: Component<ActivityListDependency>, ActivityListFactory {
    @MainActor
    public func makeView(studentID: String) -> some View {
        return ActivityListView(
            viewModel: .init(
                studentID: studentID,
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                fetchMyActivityUseCase: self.dependency.fetchMyActivityUseCase,
                fetchActivityByIDUseCase: self.dependency.fetchActivityByIDUseCase
            ),
            inputActivityFactory: dependency.inputActivityFactory,
            activityDetailFactory: dependency.activityDetailFactory
        )
    }
}
