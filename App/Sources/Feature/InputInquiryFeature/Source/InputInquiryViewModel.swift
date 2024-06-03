import Foundation
import Service

final class InputInquiryViewModel: BaseViewModel {
    @Published var question: String = ""
    @Published var questionDetail: String = ""
    @Published var isShowingAlert: Bool = false
    @Published var inquiryDetail: InquiryDetailEntity?
    var state: String = ""
    var inquiryID: String = ""

    private let inputInquiryUseCase: any InputInquiryUseCase
    private let modifyMyInquiryUseCase: any ModifyMyInquiryUseCase
    private let fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase

    init(
        state: String,
        inquiryID: String,
        inputInquiryUseCase: any InputInquiryUseCase,
        modifyMyInquiryUseCase: any ModifyMyInquiryUseCase,
        fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase
    ) {
        self.state = state
        self.inquiryID = inquiryID
        self.inputInquiryUseCase = inputInquiryUseCase
        self.modifyMyInquiryUseCase = modifyMyInquiryUseCase
        self.fetchInquiryDetailUseCase = fetchInquiryDetailUseCase
    }

    func updateIsShowingAlert(isShowing: Bool) {
        isShowingAlert = isShowing
    }

    func updateQuestion(question: String) {
        self.question = question
    }

    func updateQuestionDetail(content: String) {
        questionDetail = content
    }

    func updateQuestion(question: InquiryDetailEntity) {
        updateQuestion(question: question.question)
        updateQuestionDetail(content: question.questionDetail)
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                inquiryDetail = try await fetchInquiryDetailUseCase(inquiryID: inquiryID)

                guard let inquiryDetail else { return }

                updateQuestion(question: inquiryDetail)
            } catch {
                errorMessage = error.inquiryDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func applyButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                switch state {
                case "추가":
                    try await addInquiry()

                case "수정":
                    try await updateInquiry()

                default:
                    return
                }

                success()
            } catch {
                errorMessage = error.inquiryDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func addInquiry() async throws {
        try await inputInquiryUseCase(req: .init(question: question, questionDetail: questionDetail))
    }

    func updateInquiry() async throws {
        try await modifyMyInquiryUseCase(
            inquiryID: inquiryID,
            req: .init(question: question, questionDetail: questionDetail)
        )
    }
}
