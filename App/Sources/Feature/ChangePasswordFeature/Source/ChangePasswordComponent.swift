import NeedleFoundation
import SwiftUI
import Service

public protocol ChangePasswordDependency: Dependency {}

public final class ChangePasswordComponent: Component<ChangePasswordDependency>, ChangePasswordFactory {
    public func makeView() -> some View {
        ChangePasswordView()
    }
}
