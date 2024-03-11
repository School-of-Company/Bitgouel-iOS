import Foundation
import Service

final class InquiryDetailViewModel: BaseViewModel {
    @Published var inquiryDetail: InquiryDetailEntity?
    @Published var inquiryID: String = ""
    @Published var authority: UserAuthorityType = .user

    init(
        inquiryID: String
    ) {
        self.inquiryID = inquiryID
    }
}
