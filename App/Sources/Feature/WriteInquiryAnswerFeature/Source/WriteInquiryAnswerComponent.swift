import NeedleFoundation
import Service
import SwiftUI

public protocol WriteInquiryAnswerDependency: Dependency {
    var replyInquiryUseCase: any ReplyInquiryUseCase { get }
}

public final class WriteInquiryAnswerComponent: Component<WriteInquiryAnswerDependency>, WriteInquiryAnswerFactory {
    public func makeView(inquiryID: String) -> some View {
        WriteInquiryAnswerView(
            viewModel: .init(
                inquiryID: inquiryID,
                replyInquiryUseCase: dependency.replyInquiryUseCase
            )
        )
    }
}
