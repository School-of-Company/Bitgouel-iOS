import NeedleFoundation
import Service
import SwiftUI

public protocol NoticeDetailDependency: Dependency {}

public final class NoticeDetailViewComponent: Component<NoticeDetailDependency>, NoticeDetailFactory {
    public func makeView(noticeID: String) -> some View {
        NoticeDetailView(
            viewModel: .init(
                noticeID: noticeID
            )
        )
    }
}
