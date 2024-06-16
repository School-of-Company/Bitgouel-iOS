import NeedleFoundation
import Service
import SwiftUI

public protocol NoticeListDependency: Dependency {
    var inquiryListFactory: any InquiryListFactory { get }
    var noticeDetailFactory: any NoticeDetailFactory { get }
    var inputNoticeFactory: any InputNoticeFactory { get }
    var fetchPostListUseCase: any FetchPostListUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
}

public final class NoticeListComponent: Component<NoticeListDependency>, NoticeListFactory {
    public func makeview() -> some View {
        NoticeListView(
            viewModel: .init(
                fetchPostListUseCase: dependency.fetchPostListUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase
            ),
            inquiryListFactory: dependency.inquiryListFactory,
            noticeDetailFactory: dependency.noticeDetailFactory,
            inputNoticeFactory: dependency.inputNoticeFactory
        )
    }
}
