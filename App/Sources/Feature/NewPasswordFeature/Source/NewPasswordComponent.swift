import NeedleFoundation
import SwiftUI
import Service

public protocol NewPasswordDependency: Dependency {}

public final class NewPasswordComponent: Component<NewPasswordDependency>, NewPasswordFactory {
    public func makeView() -> some View {
        NewPasswordView()
    }
}
