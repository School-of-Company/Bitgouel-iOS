import NeedleFoundation
import SwiftUI

public protocol SuccessChangePasswordDependency: Dependency {
    var myPageFactory: any MyPageFactory { get }
}

public final class SuccessChangePasswordComponent: Component<SuccessChangePasswordDependency>,
    SuccessChangePasswordFactory {
    public func makeView() -> some View {
        SuccessChangePasswordView(
            myPageFactory: dependency.myPageFactory
        )
    }
}
