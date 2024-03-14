import NeedleFoundation
import SwiftUI
import Service

public protocol WriteInquiryAnswerDependency: Dependency {}

public final class WriteInquiryAnswerComponent: Component<WriteInquiryAnswerDependency>, WriteInquiryAnswerFactory {
    public func makeView(inquiryID: String) -> some View {
        WriteInquiryAnswerView()
    }
}
