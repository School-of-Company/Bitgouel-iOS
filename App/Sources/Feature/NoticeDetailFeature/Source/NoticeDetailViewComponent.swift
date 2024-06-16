import NeedleFoundation
import Service
import SwiftUI

public protocol NoticeDetailDependency: Dependency {
    var inputNoticeFactory: any InputNoticeFactory { get }
    var fetchPostDetailUseCase: any FetchPostDetailUseCase { get }
    var deletePostUseCase: any DeletePostUseCase { get }
}

public final class NoticeDetailViewComponent: Component<NoticeDetailDependency>, NoticeDetailFactory {
    public func makeView(noticeID: String) -> some View {
        NoticeDetailView(
            viewModel: .init(
                noticeID: noticeID,
                fetchPostDetailUseCase: dependency.fetchPostDetailUseCase,
                deletePostUseCase: dependency.deletePostUseCase
            ),
            inputNoticeFactory: dependency.inputNoticeFactory
        )
    }
}
