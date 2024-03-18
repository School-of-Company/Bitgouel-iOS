import NeedleFoundation
import SwiftUI

public protocol RootDependency: Dependency {
    var loginFactory: any LoginFactory { get }
    var mainTabFactory: any MainTabFactory { get }
    var adminUserListFactory: any AdminUserListFactory { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            loginFactory: self.dependency.loginFactory,
            mainTabFactory: self.dependency.mainTabFactory,
            adminUserListFactory: self.dependency.adminUserListFactory
        )
    }
}
