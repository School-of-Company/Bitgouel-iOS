import Foundation
import Service

final class InquiryDetailViewModel: BaseViewModel {
    @Published var inquiryDetail: InquiryDetailEntity?
    @Published var inquiryID: String = ""
    @Published var authority: UserAuthorityType = .user
    @Published var isPresentedInputInquiryView: Bool = false

    init(
        inquiryID: String
    ) {
        self.inquiryID = inquiryID
    }

    func updateIsPresentedInputInquiryView(isPresented: Bool) {
        isPresentedInputInquiryView = isPresented
    }
}
