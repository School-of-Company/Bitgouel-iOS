import SwiftUI
import Service

final class InquiryDetailViewModel: BaseViewModel {
    @Published var inquiryDetail: InquiryDetailEntity?
    @Published var inquiryID: String = ""
    @Published var authority: UserAuthorityType = .user
    @Published var isPresentedInputInquiryView: Bool = false

    private let fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase

    var statusColor: Color {
        guard let status = inquiryDetail?.answerStatus else { return .bitgouel(.greyscale(.g0)) }

        switch status {
        case .answered:
            return .bitgouel(.primary(.p5))
        case .unanswered:
            return .bitgouel(.error(.e5))
        }
    }

    init(
        inquiryID: String,
        fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    ) {
        self.inquiryID = inquiryID
        self.fetchInquiryDetailUseCase = fetchInquiryDetailUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
    }

    func updateIsPresentedInputInquiryView(isPresented: Bool) {
        isPresentedInputInquiryView = isPresented
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        Task {
            do {
                inquiryDetail = try await fetchInquiryDetailUseCase(inquiryID: inquiryID)
            } catch {
                print(String(describing: error))
            }
        }
    }
}
