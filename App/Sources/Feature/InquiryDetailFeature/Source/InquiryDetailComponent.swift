import NeedleFoundation
import SwiftUI
import Service

public protocol InquiryDetailDependency: Dependency {
    var inputInquiryFactory: any InputInquiryFactory { get }
}

final class InquiryDetailComponent: Component<InquiryDetailDependency>, InquiryDetailFactory {
    func makeView(inquiryID: String) -> some View {
        InquiryDetailView(
            viewModel: .init(inquiryID: inquiryID),
            inputInquiryFactory: dependency.inputInquiryFactory
        )
    }
}
