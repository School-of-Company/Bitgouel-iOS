import NeedleFoundation
import SwiftUI
import Service

public protocol InputInquiryDependency: Dependency {
    var inputInquiryUseCase: any InputInquiryUseCase { get }
}

public final class InputInquiryComponent: Component<InputInquiryDependency>, InputInquiryFactory {
    public func makeView(
        state: String,
        inquiryID: String
    ) -> some View {
        InputInquiryView(
            viewModel: .init(
                state: state,
                inquiryID: inquiryID,
                inputInquiryUseCase: dependency.inputInquiryUseCase
            )
        )
    }
}
