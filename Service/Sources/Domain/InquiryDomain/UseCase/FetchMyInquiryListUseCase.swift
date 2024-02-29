import Foundation

public protocol FetchMyInquiryListUseCase {
    func callAsFunction() async throws -> [InquiryInfoEntity]
}
