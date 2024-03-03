import NeedleFoundation
import Service
import SwiftUI

public protocol InputNoticeDependency: Dependency {
    var noticeDetailSettingFactory: any NoticeDetailSettingFactory { get }
    var queryPostDetailUseCase: any QueryPostDetailUseCase { get }
    var writePostUseCase: any WritePostUseCase { get }
    var updatePostUseCase: any UpdatePostUseCase { get }
}

public final class InputNoticeComponent: Component<InputNoticeDependency>, InputNoticeFactory {
    public func makeView(
        state: String,
        noticeID: String
    ) -> some View {
        InputNoticeView(
            viewModel: .init(
                state: state,
                noticeID: noticeID,
                queryPostDetailUseCase: dependency.queryPostDetailUseCase,
                writePostUseCase: dependency.writePostUseCase,
                updatePostUseCase: dependency.updatePostUseCase
            ),
            noticeDetailSettingFactory: dependency.noticeDetailSettingFactory
        )
    }
}
