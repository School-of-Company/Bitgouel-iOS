import NeedleFoundation
import Service
import SwiftUI

public protocol SuccessSignUpDependency: Dependency {
    var loginFactory: any LoginFactory { get }
}

public final class SuccessSignUpComponent: Component<SuccessSignUpDependency>, SuccessSignUpFactory {
    public func makeView() -> some View {
        SuccessSignUpView(
            loginFactory: self.dependency.loginFactory
        )
    }
}
