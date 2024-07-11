import NeedleFoundation
import SwiftUI

public protocol CompanyListDependency: Dependency {}

public final class CompanyListComponent: Component<CompanyListDependency>, CompanyListFactory {
    public func makeView() -> some View {
        CompanyListView()
    }
}
