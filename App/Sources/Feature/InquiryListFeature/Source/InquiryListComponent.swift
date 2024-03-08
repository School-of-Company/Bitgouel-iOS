import NeedleFoundation
import SwiftUI
import Service

public protocol InquiryListDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase { get }
    var fetchInquiryByAdminUseCase: any FetchInquiryByAdminUseCase { get }
}

public final class InquiryListComponent: Component<InquiryListDependency>, InquiryListFactory {
    public func makeView() -> some View {
        InquiryListView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                fetchMyInquiryListUseCase: dependency.fetchMyInquiryListUseCase,
                fetchInquiryByAdminUseCase: dependency.fetchInquiryByAdminUseCase
            )
        )
    }
}
