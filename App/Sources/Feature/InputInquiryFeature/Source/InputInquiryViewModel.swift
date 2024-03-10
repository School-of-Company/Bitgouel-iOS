import Foundation
import Service

final class InputInquiryViewModel: BaseViewModel {
    @Published var question: String = ""
    @Published var questionDetail: String = ""
    var state: String = ""
    var inquiryID: String = ""

    private let inputInquiryUseCase: any InputInquiryUseCase

    init(
        state: String,
        inquiryID: String,
        inputInquiryUseCase: any InputInquiryUseCase
    ) {
        self.state = state
        self.inquiryID = inquiryID
        self.inputInquiryUseCase = inputInquiryUseCase
    }

    func applyButtonDidTap() {
        Task {
            do {
                switch state {
                case "추가":
                    return try await addInquiry()
                default:
                    return
                }
            } catch {
                print(String(describing: error))
            }
        }
    }

    func addInquiry() async throws {
        try await inputInquiryUseCase(req: .init(question: question, questionDetail: questionDetail))
    }
}
