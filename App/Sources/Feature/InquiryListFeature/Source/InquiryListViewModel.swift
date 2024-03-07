import Foundation
import Service

final class InquiryListViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var inquiryList: [InquiryInfoEntity] = []
    @Published var answerStatus: AnswerStatusType?
    @Published var keyword: String = ""
    var answerStatusList: [AnswerStatusType] = AnswerStatusType.allCases

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase
    private let fetchInquiryByAdminUseCase: any FetchInquiryByAdminUseCase

    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase,
        fetchInquiryByAdminUseCase: any FetchInquiryByAdminUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchMyInquiryListUseCase = fetchMyInquiryListUseCase
        self.fetchInquiryByAdminUseCase = fetchInquiryByAdminUseCase
    }

    func updateAnswerStatus(answer: AnswerStatusType) {
        answerStatus = answer
    }
    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        Task {
            do {
                let inquiryInfo: [InquiryInfoEntity] = try await { () async throws -> [InquiryInfoEntity] in
                    switch authority {
                    case .admin: return try await onAppearInquiryByAdmin()
                    default: return try await onAppearMyInquiry()
                    }
                }()

                updateContent(entity: inquiryInfo)
            } catch {
                print(String(describing: error))
            }
        }
    }

    func updateContent(entity: [InquiryInfoEntity]) {
        inquiryList = entity
    }

    func onAppearInquiryByAdmin() async throws -> [InquiryInfoEntity] {
        return try await fetchInquiryByAdminUseCase(answerStatus: answerStatus?.rawValue ?? "", keyword: keyword)
    }

    func onAppearMyInquiry() async throws -> [InquiryInfoEntity] {
        return try await fetchMyInquiryListUseCase()
    }
}
