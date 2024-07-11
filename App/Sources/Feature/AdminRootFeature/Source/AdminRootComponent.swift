import NeedleFoundation
import SwiftUI

public protocol AdminRootDependency: Dependency {}

public final class AdminRootComponent: Component<AdminRootDependency>, AdminRootFactory {
    public func makeView() -> some View {
        AdminRootView()
    }
}
