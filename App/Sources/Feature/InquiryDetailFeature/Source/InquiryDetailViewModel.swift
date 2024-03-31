import Service
import SwiftUI

final class InquiryDetailViewModel: BaseViewModel {
    @Published var inquiryDetail: InquiryDetailEntity?
    @Published var inquiryID: String = ""
    @Published var authority: UserAuthorityType = .user
    @Published var isPresentedInputInquiryView: Bool = false
    @Published var isPresentedWriteInquiryAnswerView: Bool = false
    @Published var isDeleteInquiry: Bool = false
    @Published var isWriteInquiryAnswer: Bool = false

    private let fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let deleteMyInquiryUseCase: any DeleteMyInquiryUseCase
    private let deleteInquiryByAdminUseCase: any DeleteInquiryByAdminUseCase

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
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        deleteMyInquiryUseCase: any DeleteMyInquiryUseCase,
        deleteInquiryByAdminUseCase: any DeleteInquiryByAdminUseCase
    ) {
        self.inquiryID = inquiryID
        self.fetchInquiryDetailUseCase = fetchInquiryDetailUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.deleteMyInquiryUseCase = deleteMyInquiryUseCase
        self.deleteInquiryByAdminUseCase = deleteInquiryByAdminUseCase
    }

    func updateIsPresentedWriteInquiryAnswerView(isPresented: Bool) {
        isPresentedWriteInquiryAnswerView = isPresented
    }

    func updateIsPresentedInputInquiryView(isPresented: Bool) {
        isPresentedInputInquiryView = isPresented
    }

    func updateIsDeleteInquiry(isDelete: Bool) {
        isDeleteInquiry = isDelete
    }

    func updateIsWriteInquiryAnswer(isWrite: Bool) {
        isWriteInquiryAnswer = isWrite
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

    func deleteAction(_ success: @escaping () -> Void) {
        Task {
            do {
                switch authority {
                case .admin:
                    try await deleteInquiryByAdmin()
                default:
                    try await deleteMyInquiry()
                }

                success()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func deleteInquiryByAdmin() async throws {
        return try await deleteInquiryByAdminUseCase(inquiryID: inquiryID)
    }

    func deleteMyInquiry() async throws {
        return try await deleteMyInquiryUseCase(inquiryID: inquiryID)
    }
}
