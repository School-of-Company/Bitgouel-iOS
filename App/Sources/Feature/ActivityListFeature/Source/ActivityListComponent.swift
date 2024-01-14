import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityListDependency: Dependency {
    var inputActivityFactory: any InputActivityFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase { get }
    var queryStudentActivityListUseCase: any QueryStudentActivityListUseCase { get }
    var queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase { get }
}

public final class ActivityListComponent: Component<ActivityListDependency>, ActivityListFactory {
    @MainActor
    public func makeView(studentID: UUID) -> some View {
        let model = ActivityListModel()
        return ActivityListView(
            inputActivityFactory: dependency.inputActivityFactory,
            model: model,
            viewModel: .init(
                studentID: studentID,
                model: model,
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                queryMyStudentActivityUseCase: self.dependency.queryMyStudentActivityUseCase,
                queryStudentActivityListUseCase: self.dependency.queryStudentActivityListUseCase,
                queryStudentActivityByIdUseCase: self.dependency.queryStudentActivityByIdUseCase
            )
        )
    }
}
