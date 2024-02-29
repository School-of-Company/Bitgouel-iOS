import Foundation

public struct DeleteInquiryByAdminImpl: DeleteInquiryByAdminUseCase {
    private let inquiryRepository: any InquiryRepository
    
    public init(inquiryRepository: any InquiryRepository) {
        self.inquiryRepository = inquiryRepository
    }
    
    public func callAsFunction(inquiryID: String) async throws {
        try await inquiryRepository.deleteInquiryByAdmin(inquiryID: inquiryID)
    }
}
