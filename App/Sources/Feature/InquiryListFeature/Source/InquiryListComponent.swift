import NeedleFoundation
import SwiftUI
import Service

public protocol InquiryListDependency: Dependency {
    
}

public final class InquiryListComponent: Component<InquiryListDependency>, InquiryListFactory {
    public func makeView() -> some View {
        InquiryListView()
    }
}
