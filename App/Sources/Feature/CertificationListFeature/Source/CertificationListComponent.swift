import NeedleFoundation
import Service
import SwiftUI

public protocol CertificationListDependency: Dependency {
    var activityListFactory: any ActivityListFactory { get }
}

public final class CertificationListComponent: Component<CertificationListDependency>, CertificationListFactory {
    public func makeView(studentID: String) -> some View {
        CertificationListView(
            viewModel: .init(
                studentID: studentID
            ),
            activityListFactory: dependency.activityListFactory
        )
    }
}
