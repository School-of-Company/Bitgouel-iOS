import Foundation

final class InputInquiryViewModel: BaseViewModel {
    @Published var question: String = ""
    @Published var questionDetail: String = ""
    var state: String = ""
    var inquiryID: String = ""
    
    init(
        state: String,
        inquiryID: String
    ) {
        self.state = state
        self.inquiryID = inquiryID
    }
}
