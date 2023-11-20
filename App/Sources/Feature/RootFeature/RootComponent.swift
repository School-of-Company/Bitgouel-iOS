import NeedleFoundation
import SwiftUI

public protocol RootDependency: Dependency {
    var loginFactory: LoginFactory { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            loginfactory: self.dependency.loginFactory
        )
    }
}
