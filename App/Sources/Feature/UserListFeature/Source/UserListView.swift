import SwiftUI

struct UserListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: UserListViewModel

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
                            viewModel.updateIsPresentedUserTypeBottomSheet(isPresented: true)
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
                    viewModel.isNavigateRequestSignUpDidTap = true
                } label: {
                    BitgouelAsset.Icons.addFill.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }

                Button {
                    viewModel.isNavigateWithdrawListDidTap = true
                } label: {
                    BitgouelAsset.Icons.minusFill.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .navigate(
            to: requestUserSignupFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateRequestSignUpDidTap },
                set: { _ in viewModel.requestSignUpPageDismissed() }
            )
        )
        .navigate(
            to: withdrawUserListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateWithdrawListDidTap },
                set: { _ in viewModel.withdrawListPageDismissed() }
            )
        )
        .bitgouelBottomSheet(isShowing: $viewModel.isPresentedUserTypeBottomSheet) {
            UserTypeFilterBottomSheet(
                selectedAuthority: viewModel.selectedAuthority
            ) { authority in
                viewModel.updateSelectedAuthority(authority: authority)
                viewModel.onAppear()
            } cancel: { cancel in
                viewModel.updateIsPresentedUserTypeBottomSheet(isPresented: cancel)
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isPresentedOtherListBottomSheet) {
            OtherPageListBottomSheet(
                selectedPage: viewModel.selectedPage
            ) { page in
                viewModel.updateSelectedPage(page: page)
                viewModel.onAppear()
            } cancel: { cancel in
                viewModel.updateIsPresentedOtherListBottomSheet(isPresented: cancel)
            }
        }
    }
}
