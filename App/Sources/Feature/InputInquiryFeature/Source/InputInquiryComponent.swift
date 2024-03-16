import NeedleFoundation
import SwiftUI
import Service

public protocol InputInquiryDependency: Dependency {
    var inputInquiryUseCase: any InputInquiryUseCase { get }
    var modifyMyInquiryUseCase: any ModifyMyInquiryUseCase { get }
    var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase { get }
}

public final class InputInquiryComponent: Component<InputInquiryDependency>, InputInquiryFactory {
    @MainActor
    public func makeView(
        state: String,
        inquiryID: String
    ) -> some View {
        InputInquiryView(
            viewModel: .init(
                state: state,
                inquiryID: inquiryID,
                inputInquiryUseCase: dependency.inputInquiryUseCase,
                modifyMyInquiryUseCase: dependency.modifyMyInquiryUseCase,
                fetchInquiryDetailUseCase: dependency.fetchInquiryDetailUseCase
            )
        )
    }
}
