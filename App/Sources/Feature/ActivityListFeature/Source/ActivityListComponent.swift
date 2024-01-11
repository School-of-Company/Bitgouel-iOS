import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityListDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase { get }
    var queryStudentActivityListUseCase: any QueryStudentActivityListUseCase { get }
    var queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase { get }
}

@MainActor
public final class ActivityListComponent: Component<ActivityListDependency>, ActivityListFactory {
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
                queryStudentActivityByIdUseCase: self.dependency.queryStudentActivityByIdUseCase
            )
        )
    }
}
