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
                            UserListRow(
                                name: userInfo.name,
                                authoruty: userInfo.authority.display(),
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
                    viewModel.updateIsPresentedOtherListBottomSheet(isPresented: true)
                } label: {
                    BitgouelAsset.Icons.sandwich.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
            }
        }
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
