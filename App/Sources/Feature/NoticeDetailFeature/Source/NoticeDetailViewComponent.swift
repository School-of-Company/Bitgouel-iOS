import NeedleFoundation
import SwiftUI
import Service

public protocol NoticeDetailDependency: Dependency {
    var queryPostDetailUseCase: any QueryPostDetailUseCase { get }
    var deletePostUseCase: any DeletePostUseCase { get}
}

public final class NoticeDetailViewComponent: Component<NoticeDetailDependency>, NoticeDetailFactory {
    public func makeView(noticeID: String) -> some View {
        NoticeDetailView(
            viewModel: .init(
                noticeID: noticeID,
                queryPostDetailUseCase: dependency.queryPostDetailUseCase,
                deletePostUseCase: dependency.deletePostUseCase
            )
        )
    }
}
