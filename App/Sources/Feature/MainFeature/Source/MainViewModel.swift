import Foundation
import Service

final class MainViewModel: BaseViewModel {
    @Published var faqList: [FAQInfoEntity] = []
    @Published var authority: UserAuthorityType = .user
    @Published var question: String = ""
    @Published var answer: String = ""
    @Published var inputFAQButtonDidTap: Bool = false

    private let fetchFAQListUseCase: any FetchFAQListUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let inputFAQUseCase: any InputFAQUseCase

    init(
        fetchFAQListUseCase: any FetchFAQListUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        inputFAQUseCase: any InputFAQUseCase
    ) {
        self.fetchFAQListUseCase = fetchFAQListUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.inputFAQUseCase = inputFAQUseCase
    }

    func updateFAQ(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }

    func updateInputFAQButtonDidTap(state: Bool) {
        inputFAQButtonDidTap = state
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        Task {
            do {
                faqList = try await fetchFAQListUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func inputFAQ() {
        Task {
            do {
                try await inputFAQUseCase(req: InputFAQRequestDTO(question: question, answer: answer))

                updateInputFAQButtonDidTap(state: false)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
