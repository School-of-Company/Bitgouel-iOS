import SwiftUI

struct UserListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: UserListViewModel
    @EnvironmentObject var adminPageState: AdminPageState

    private let withdrawUserListFactory: any WithdrawUserListFactory
    private let requestUserSignupFactory: any RequestUserSignupFactory

    init(
        viewModel: UserListViewModel,
        withdrawUserListFactory: any WithdrawUserListFactory,
        requestUserSignupFactory: any RequestUserSignupFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.withdrawUserListFactory = withdrawUserListFactory
        self.requestUserSignupFactory = requestUserSignupFactory
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    UserNameSearchTextField(
                        text: $viewModel.keyword
                    )
                    .onChange(of: viewModel.keyword) { _ in
                        viewModel.onAppear()
                    }

                    BitgouelAsset.Icons.filterStroke.swiftUIImage
                        .padding(.horizontal, 10)
                        .padding(.vertical, 15)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.bitgouel(.greyscale(.g7)))
                        }
                        .onTapGesture {
                            viewModel.updateIsShowingUserTypeBottomSheet(isShowing: true)
                        }
                }
                .padding(.top, 24)

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.userList, id: \.userID) { userInfo in
                            UserInfoListRow(
                                name: userInfo.name,
                                authority: userInfo.authority.display(),
                                phoneNumber: userInfo.phoneNumber.withHypen,
                                email: userInfo.email
                            )

                            Divider()
                                .frame(height: 1)
                                .padding(.vertical, 12)
                        }
                    }
                }
                .padding(.top, 24)
            }
            .padding(.horizontal, 28)
        }
        .navigationTitle("사용자 명단")
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.onAppear()
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.updateIsShowingAdminPageBottomSheet(isShowing: true)
                } label: {
                    BitgouelAsset.Icons.sandwich.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingUserTypeBottomSheet) {
            UserTypeFilterBottomSheet(
                selectedAuthority: viewModel.selectedAuthority
            ) { authority in
                viewModel.updateSelectedAuthority(authority: authority)
                viewModel.onAppear()
            } cancel: { cancel in
                viewModel.updateIsShowingUserTypeBottomSheet(isShowing: cancel)
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingAdminPageBottomSheet) {
            AdminPageListBottomSheet(
                selectedPage: viewModel.selectedPage
            ) { page in
                viewModel.updateSelectedPage(page: page)
                adminPageState.adminPageFlow = page
            } cancel: { cancel in
                viewModel.updateIsShowingAdminPageBottomSheet(isShowing: cancel)
            }
        }
    }
}
