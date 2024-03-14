import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityListDependency: Dependency {
    var activityDetailFactory: any ActivityDetailFactory { get }
    var inputActivityFactory: any InputActivityFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchMyActivityUseCase: any FetchMyActivityUseCase { get }
    var fetchActivityListUseCase: any FetchActivityListUseCase { get }
    var fetchActivityByIDUseCase: any FetchActivityByIDUseCase { get }
}

public final class ActivityListComponent: Component<ActivityListDependency>, ActivityListFactory {
    @MainActor
    public func makeView(studentID: String) -> some View {
        let model = ActivityListModel()
        return ActivityListView(
            model: model,
            viewModel: .init(
                studentID: studentID,
                model: model,
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                fetchMyActivityUseCase: self.dependency.fetchMyActivityUseCase,
                fetchActivityListUseCase: self.dependency.fetchActivityListUseCase,
                fetchActivityByIDUseCase: self.dependency.fetchActivityByIDUseCase
            ),
            inputActivityFactory: dependency.inputActivityFactory, 
            activityDetailFactory: dependency.activityDetailFactory
        )
    }
}
