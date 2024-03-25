import Foundation
import Service

final class MainViewModel: BaseViewModel {
    @Published var faqList: [FAQInfoEntity] = []
    var authority: UserAuthorityType = .user

    private let fetchFAQListUseCase: any FetchFAQListUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase

    init(
        fetchFAQListUseCase: any FetchFAQListUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    ) {
        self.fetchFAQListUseCase = fetchFAQListUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
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
}
