import NeedleFoundation
import SwiftUI
import Service

public protocol InputInquiryDependency: Dependency {
    
}

public final class InputInquiryComponent: Component<InputInquiryDependency>, InputInquiryFactory {
    public func makeView(
        state: String,
        inquiryID: String
    ) -> some View {
        InputInquiryView(
            viewModel: .init(
                state: state,
                inquiryID: inquiryID
            )
        )
    }
}
