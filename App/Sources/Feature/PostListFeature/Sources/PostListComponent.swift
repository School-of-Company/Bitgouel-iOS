import NeedleFoundation
import Service
import SwiftUI

public protocol PostListDependency: Dependency {
    var noticeListFactory: any NoticeListFactory { get }
    var inquiryListFactory: any InquiryListFactory { get }
    var inputPostFactory: any InputPostFactory { get }
    var postDetailFactory: any PostDetailFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchPostListUseCase: any FetchPostListUseCase { get }
}

public final class PostListComponent: Component<PostListDependency>, PostListFactory {
    public func makeView(selection: Binding<TabFlow>) -> some View {
        PostListView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                fetchPostListUseCase: dependency.fetchPostListUseCase
            ),
            noticeListFactory: dependency.noticeListFactory,
            inquiryListFactory: dependency.inquiryListFactory,
            inputPostFactory: dependency.inputPostFactory,
            postDetailFactory: dependency.postDetailFactory,
            selection: selection
        )
    }
}
