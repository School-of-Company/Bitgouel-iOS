import NeedleFoundation
import Service
import SwiftUI

public protocol InquiryDetailDependency: Dependency {
    var inputInquiryFactory: any InputInquiryFactory { get }
    var writeInquiryAnswerFactory: any WriteInquiryAnswerFactory { get }
    var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var deleteMyInquiryUseCase: any DeleteMyInquiryUseCase { get }
    var deleteInquiryByAdminUseCase: any DeleteInquiryByAdminUseCase { get }
}

final class InquiryDetailComponent: Component<InquiryDetailDependency>, InquiryDetailFactory {
    func makeView(inquiryID: String) -> some View {
        InquiryDetailView(
            viewModel: .init(
                inquiryID: inquiryID,
                fetchInquiryDetailUseCase: dependency.fetchInquiryDetailUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                deleteMyInquiryUseCase: dependency.deleteMyInquiryUseCase,
                deleteInquiryByAdminUseCase: dependency.deleteInquiryByAdminUseCase
            ),
            inputInquiryFactory: dependency.inputInquiryFactory,
            writeInquiryAnswerFactory: dependency.writeInquiryAnswerFactory
        )
    }
}
