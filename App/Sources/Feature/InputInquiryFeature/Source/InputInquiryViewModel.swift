import Foundation
import Service

final class InputInquiryViewModel: BaseViewModel {
    @Published var question: String = ""
    @Published var questionDetail: String = ""
    @Published var isShowingAlert: Bool = false
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

    func onAppear() {
        Task {
            do {
                let response = try await fetchInquiryDetailUseCase(inquiryID: inquiryID)
                
                question = response.question
                questionDetail = response.questionDetail
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func applyButtonDidTap() {
        Task {
            do {
                switch state {
                case "추가":
                    return try await addInquiry()
                case "수정":
                    return try await updateInquiry()
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
    
    func updateInquiry() async throws {
        try await modifyMyInquiryUseCase(inquiryID: inquiryID, req: .init(question: question, questionDetail: questionDetail))
    }
}
