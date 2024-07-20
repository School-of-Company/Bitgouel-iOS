import SwiftUI

struct RequestUserSignupView: View {
    @StateObject var viewModel: RequestUserSignupViewModel
    @EnvironmentObject var adminPageState: AdminPageState

    private let userListFactory: any UserListFactory
    private let withdrawUserListFactory: any WithdrawUserListFactory

    init(
        viewModel: RequestUserSignupViewModel,
        userListFactory: any UserListFactory,
        withdrawUserListFactory: any WithdrawUserListFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.userListFactory = userListFactory
        self.withdrawUserListFactory = withdrawUserListFactory
    }

    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                HStack {
                    VStack(spacing: 4) {
                        BitgouelText(
                            text: "전체",
                            font: .caption
                        )
                        .foregroundColor(.bitgouel(.greyscale(.g4)))
                        .padding(.top, 12)

                        CheckButton(
                            isSelected: Binding(
                                get: { viewModel.isSelectedUserList },
                                set: { isSelected in
                                    if isSelected {
                                        viewModel.insertAllUserList()
                                    } else {
                                        viewModel.removeAllUserList()
                                    }
                                    viewModel.updateIsSelectedUserList(isSelected: isSelected)
                                }
                            )
                        )
                    }

                    Spacer()
                }

                Divider()

                ScrollView {
                    if viewModel.userList.isEmpty {
                        NoInfoView(text: "가입 요청자가 없어요")
                    } else {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ForEach(viewModel.userList, id: \.userID) { userInfo in
                                UserInfoListRow(
                                    name: userInfo.name,
                                    authority: userInfo.authority.display(),
                                    phoneNumber: userInfo.phoneNumber,
                                    email: userInfo.email,
                                    hasCheckButton: true,
                                    isSelected: Binding(
                                        get: { viewModel.selectedUserList.contains(userInfo.userID) },
                                        set: { isSelected in
                                            viewModel.insertUserList(userID: userInfo.userID)
                                            if !isSelected {
                                                viewModel.removeUserList(userID: userInfo.userID)
                                            }
                                        }
                                    )
                                )

                                Divider()
                                    .frame(height: 1)
                                    .padding(.vertical, 14)
                            }
                        }
                    }
                }

                Spacer()
            }
        }
        .overlay(alignment: .bottom) {
            handleRequest()
        }
        .padding(.horizontal, 28)
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.onAppear()
        }
        .navigationTitle("가입 요청자 명단")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
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
        .bitgouelAlert(
            title: "선택한 사용자의 가입을 수락 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isShowingApproveAlert,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.updateIsShowingApproveAlert(isShowing: false)
                },
                .init(text: "수락", style: .default) {
                    viewModel.approveUserSignupButtonDidTap {
                        viewModel.updateIsShowingApproveAlert(isShowing: false)
                        viewModel.onAppear()
                    }
                }
            ]
        )
        .bitgouelAlert(
            title: "선택한 사용자의 가입을 \n거절 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isShowingRejectAlert,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.updateIsShowingRejectAlert(isShowing: false)
                },
                .init(text: "거절", style: .error) {
                    viewModel.rejectUserSignupButtonDidTap {
                        viewModel.updateIsShowingRejectAlert(isShowing: false)
                        viewModel.onAppear()
                    }
                }
            ]
        )
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

    @ViewBuilder
    func handleRequest() -> some View {
        HStack(spacing: 8) {
            RejectionButton {
                viewModel.updateIsShowingRejectAlert(isShowing: true)
            }

            AcceptButton {
                viewModel.updateIsShowingApproveAlert(isShowing: true)
            }
        }
    }
}
