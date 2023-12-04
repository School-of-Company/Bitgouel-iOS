import NeedleFoundation
import SwiftUI

public protocol RootDependency: Dependency {
    var loginFactory: any LoginFactory { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            loginFactory: self.dependency.loginFactory
        )
    }
}
