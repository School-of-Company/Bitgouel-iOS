import Foundation
import Service

final class WriteInquiryAnswerViewModel: BaseViewModel {
    @Published var answer: String = ""
    var inquiryID: String = ""

    private let replyInquiryUseCase: any ReplyInquiryUseCase

    init(
        inquiryID: String,
        replyInquiryUseCase: any ReplyInquiryUseCase
    ) {
        self.inquiryID = inquiryID
        self.replyInquiryUseCase = replyInquiryUseCase
    }

    @MainActor
    func applyButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                try await replyInquiryUseCase(
                    inquiryID: inquiryID,
                    req: InquiryAnswerRequestDTO(answer: answer)
                )

                success()
            } catch {
                errorMessage = error.inquiryDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
