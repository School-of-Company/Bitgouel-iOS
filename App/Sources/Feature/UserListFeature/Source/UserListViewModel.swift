import Foundation
import Service

final class UserListViewModel: BaseViewModel {
    @Published var keyword = ""
    @Published var isSelectedUserList = false
    @Published var isShowingUserTypeBottomSheet: Bool = false
    @Published var isShowingAdminPageBottomSheet: Bool = false
    @Published var selectedAuthority: AdminUserListAuthorityType?
    @Published var selectedPage: AdminPageFlow = .user
    @Published var userList: [UserInfoEntity] = []

    private let fetchUserListUseCase: any FetchUserListUseCase

    init(
        fetchUserListUseCase: any FetchUserListUseCase
    ) {
        self.fetchUserListUseCase = fetchUserListUseCase
    }

    func updateIsShowingAdminPageBottomSheet(isShowing: Bool) {
        isShowingAdminPageBottomSheet = isShowing
    }

    func updateIsShowingUserTypeBottomSheet(isShowing: Bool) {
        isShowingUserTypeBottomSheet = isShowing
    }

    func updateSelectedAuthority(authority: AdminUserListAuthorityType) {
        guard selectedAuthority != authority else { return selectedAuthority = nil }
        selectedAuthority = authority
    }

    func updateSelectedPage(page: AdminPageFlow) {
        guard selectedPage != page else { return }
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
