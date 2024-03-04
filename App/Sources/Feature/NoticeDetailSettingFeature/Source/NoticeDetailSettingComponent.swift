import NeedleFoundation
import SwiftUI
import Service

public protocol NoticeDetailSettingDependency: Dependency {}

public final class NoticeDetailSettingComponent: Component<NoticeDetailSettingDependency>, NoticeDetailSettingFactory {
    public func makeView(
        noticeLinks: [String],
        completion: @escaping ([String]) -> Void
    ) -> some View {
        NoticeDetailSettingView(
            viewModel: .init(
                noticeLinks: noticeLinks,
                completion: completion
            )
        )
    }
}
