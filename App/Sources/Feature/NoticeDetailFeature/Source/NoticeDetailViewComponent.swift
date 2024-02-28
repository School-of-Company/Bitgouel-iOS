import NeedleFoundation
import SwiftUI
import Service

public protocol NoticeDetailDependency: Dependency {
    
}

public final class NoticeDetailViewComponent: Component<NoticeDetailDependency>, NoticeDetailFactory {
    public func makeView(noticeID: String) -> some View {
        NoticeDetailView(
            viewModel: .init(
                noticeID: noticeID
            )
        )
    }
}
