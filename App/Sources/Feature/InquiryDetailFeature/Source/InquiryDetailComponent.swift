import NeedleFoundation
import SwiftUI
import Service

public protocol InquiryDetailDependency: Dependency {
    var inputInquiryFactory: any InputInquiryFactory { get }
    var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
}

final class InquiryDetailComponent: Component<InquiryDetailDependency>, InquiryDetailFactory {
    func makeView(inquiryID: String) -> some View {
        InquiryDetailView(
            viewModel: .init(
                inquiryID: inquiryID,
                fetchInquiryDetailUseCase: dependency.fetchInquiryDetailUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase
            ),
            inputInquiryFactory: dependency.inputInquiryFactory
        )
    }
}
