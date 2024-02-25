import NeedleFoundation
import SwiftUI
import Service

public protocol CertificationListDependency: Dependency {
    
}

public final class CertificationListComponent: Component<CertificationListDependency>, CertificationListFactory {
    public func makeView(userID: String) -> some View {
        CertificationListView()
    }
}
