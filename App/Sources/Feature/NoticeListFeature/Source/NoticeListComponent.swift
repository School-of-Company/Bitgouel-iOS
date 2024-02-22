import NeedleFoundation
import SwiftUI
import Service

public protocol NoticeListDependency: Dependency {}

public final class NoticeListComponent: Component<NoticeListDependency>, NoticeListFactory {
    public func makeview() -> some View {
        NoticeListView()
    }
}
