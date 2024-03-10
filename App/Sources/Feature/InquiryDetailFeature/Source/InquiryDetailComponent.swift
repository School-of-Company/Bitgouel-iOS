import NeedleFoundation
import SwiftUI
import Service

public protocol InquiryDetailDependency: Dependency {
    
}

final class InquiryDetailComponent: Component<InquiryDetailDependency>, InquiryDetailFactory {
    func makeView(inquiryID: String) -> some View {
        InquiryDetailView()
    }
}
