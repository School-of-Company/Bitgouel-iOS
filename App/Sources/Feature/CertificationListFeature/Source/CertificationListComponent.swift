import NeedleFoundation
import SwiftUI
import Service

public protocol CertificationListDependency: Dependency {
    var activityListFactory: any ActivityListFactory { get }
    var queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase { get }
}

public final class CertificationListComponent: Component<CertificationListDependency>, CertificationListFactory {
    public func makeView(
        clubID: String,
        studentID: String
    ) -> some View {
        CertificationListView(
            viewModel: .init(
                clubID: clubID,
                studentID: studentID,
                queryStudentDetailByClubUseCase: dependency.queryStudentDetailByClubUseCase
            ),
            activityListFactory: dependency.activityListFactory
        )
    }
}
