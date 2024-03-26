import NeedleFoundation
import SwiftUI

public protocol RootDependency: Dependency {
    var loginFactory: any LoginFactory { get }
    var mainTabFactory: any MainTabFactory { get }
    var findPasswordFactory: any FindPasswordFactory { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            loginFactory: self.dependency.loginFactory,
            mainTabFactory: self.dependency.mainTabFactory,
            findPasswordFactory: self.dependency.findPasswordFactory
        )
    }
}
