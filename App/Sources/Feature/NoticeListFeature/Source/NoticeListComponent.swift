import NeedleFoundation
import SwiftUI
import Service

public protocol NoticeListDependency: Dependency {
    var inquiryListFactory: any InquiryListFactory { get }
}

public final class NoticeListComponent: Component<NoticeListDependency>, NoticeListFactory {
    public func makeview() -> some View {
        NoticeListView(
            viewModel: .init(),
            inquiryListFactory: dependency.inquiryListFactory
        )
    }
}
