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

    func applyButtonDidTap() {
        Task {
            do {
                try await replyInquiryUseCase(
                    inquiryID: inquiryID,
                    req: InquiryAnswerRequestDTO(answer: answer)
                )
            } catch {
                print(String(describing: error))
            }
        }
    }
}
