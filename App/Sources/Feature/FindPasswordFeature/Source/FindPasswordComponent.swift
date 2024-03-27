import NeedleFoundation
import Service
import SwiftUI

public protocol FindPasswordDependency: Dependency {
    var sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase { get }
    var fetchEmailVertificationStatusUseCase: any FetchEmailVertificationStatusUseCase { get }
    var newPasswordFactory: any NewPasswordFactory { get }
}

public final class FindPasswordComponent: Component<FindPasswordDependency>, FindPasswordFactory {
    public func makeView() -> some View {
        FindPasswordView(
            viewModel: .init(
                sendEmailCertificationLinkUseCase: dependency.sendEmailCertificationLinkUseCase,
                fetchEmailVertificationStatusUseCase: dependency.fetchEmailVertificationStatusUseCase
            ),
            newPasswordFactory: dependency.newPasswordFactory
        )
    }
}
