import Foundation
import Service

final class UserListViewModel: BaseViewModel {
    @Published var keyword = ""
    @Published var isSelectedUserList = false
    @Published var isPresentedUserTypeBottomSheet: Bool = false
    @Published var isPresentedOtherListBottomSheet: Bool = false
    @Published var selectedAuthority: AdminUserListAuthorityType?
    @Published var selectedPage: AdminPage?
    @Published var userList: [UserInfoEntity] = []

    private let fetchUserListUseCase: any FetchUserListUseCase

    init(
        fetchUserListUseCase: any FetchUserListUseCase
    ) {
        self.fetchUserListUseCase = fetchUserListUseCase
    }

    func updateIsPresentedUserTypeBottomSheet(isPresented: Bool) {
        isPresentedUserTypeBottomSheet = isPresented
    }

    func updateIsPresentedOtherListBottomSheet(isPresented: Bool) {
        isPresentedOtherListBottomSheet = isPresented
    }

    func updateSelectedAuthority(authority: AdminUserListAuthorityType) {
        guard selectedAuthority != authority else { return selectedAuthority = nil }
        selectedAuthority = authority
    }

    func updateSelectedPage(page: AdminPage) {
        guard selectedPage != page else { return selectedPage = nil }
        selectedPage = page
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                userList = try await fetchUserListUseCase(
                    keyword: keyword.trimmingCharacters(in: .whitespaces),
                    authority: selectedAuthority?.rawValue ?? "",
                    approveStatus: ""
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
