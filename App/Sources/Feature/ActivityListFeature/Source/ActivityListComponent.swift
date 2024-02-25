import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityListDependency: Dependency {
    var activityDetailFactory: any ActivityDetailFactory { get }
    var inputActivityFactory: any InputActivityFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase { get }
    var queryStudentActivityListUseCase: any QueryStudentActivityListUseCase { get }
    var queryStudentActivityByIDUseCase: any QueryStudentActivityByIDUseCase { get }
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
                queryMyStudentActivityUseCase: self.dependency.queryMyStudentActivityUseCase,
                queryStudentActivityListUseCase: self.dependency.queryStudentActivityListUseCase,
                queryStudentActivityByIDUseCase: self.dependency.queryStudentActivityByIDUseCase
            ),
            inputActivityFactory: dependency.inputActivityFactory, 
            activityDetailFactory: dependency.activityDetailFactory
        )
    }
}
