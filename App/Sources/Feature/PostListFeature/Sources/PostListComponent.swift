import NeedleFoundation
import Service
import SwiftUI

public protocol PostListDependency: Dependency {
    var noticeListFactory: any NoticeListFactory { get }
    var inquiryListFactory: any InquiryListFactory { get }
    var inputPostFactory: any InputPostFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryPostListUseCase: any QueryPostListUseCase { get }
}

public final class PostListComponent: Component<PostListDependency>, PostListFactory {
    public func makeView() -> some View {
        PostListView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryPostListUseCase: dependency.queryPostListUseCase
            ),
            noticeListFactory: dependency.noticeListFactory,
            inquiryListFactory: dependency.inquiryListFactory,
            inputPostFactory: dependency.inputPostFactory
        )
    }
}
