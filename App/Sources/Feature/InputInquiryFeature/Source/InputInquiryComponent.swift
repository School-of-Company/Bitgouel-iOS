import NeedleFoundation
import SwiftUI
import Service

public protocol InputInquiryDependency: Dependency {
    
}

public final class InputInquiryComponent: Component<InputInquiryDependency>, InputInquiryFactory {
    public func makeView(
        state: String,
        InquiryID: String
    ) -> some View {
        InputInquiryView()
    }
}
