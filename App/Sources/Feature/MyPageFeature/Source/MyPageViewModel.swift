import Foundation
import Service

final class MyPageViewModel: BaseViewModel {
    @Published var myInfo: MyInfoEntity?
    var authority: UserAuthorityType = .user
    var userInfo: [String] = []
    var userOrganization: String = ""

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchMyInfoUseCase: any FetchMyInfoUseCase

    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchMyInfoUseCase: any FetchMyInfoUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchMyInfoUseCase = fetchMyInfoUseCase
    }

    func updateOrganization(organization: String) {
        userInfo = organization.components(separatedBy: "/")

        userOrganization = userInfo.first ?? ""
        userInfo.removeFirst()
    }
    
    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()

        Task {
            do {
                myInfo = try await fetchMyInfoUseCase()
                
                updateOrganization(organization: myInfo?.organization ?? "")
            } catch {
                print(String(describing: error))
            }
        }
    }
}
