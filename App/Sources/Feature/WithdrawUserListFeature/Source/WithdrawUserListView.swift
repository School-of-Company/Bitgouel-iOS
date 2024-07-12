import SwiftUI

struct WithdrawUserListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: WithdrawUserListViewModel
    @EnvironmentObject var adminPageState: AdminPageState

    private let userListFactory: any UserListFactory
    private let requestUserSignupFactory: any RequestUserSignupFactory

    init(
        viewModel: WithdrawUserListViewModel,
        userListFactory: any UserListFactory,
        requestUserSignupFactory: any RequestUserSignupFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.userListFactory = userListFactory
        self.requestUserSignupFactory = requestUserSignupFactory
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

                    HStack {
                        BitgouelAsset.Icons.filter.swiftUIImage

                        BitgouelText(
                            text: "필터",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                    .onTapGesture {
                        viewModel.updateIsPresentedCohortBottomSheet(isPresented: true)
                    }
                }

                Divider()

                ScrollView {
                    if viewModel.userList.isEmpty {
                        NoInfoView(text: "탈퇴 예정자가 없어요")
                    } else {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ForEach(viewModel.userList, id: \.userID) { userInfo in
                                UserInfoListRow(
                                    name: userInfo.name,
                                    authority: "",
                                    phoneNumber: userInfo.phoneNumber,
                                    email: userInfo.email,
                                    hasCheckButton: true,
                                    isSelected: Binding(
                                        get: { viewModel.selectedWithdrawUserList.contains(userInfo.userID) },
                                        set: { isSelected in
                                            if isSelected {
                                                viewModel.insertUserList(userID: userInfo.userID)
                                            } else {
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
            .padding(.horizontal, 28)
        }
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.onAppear()
        }
        .navigationTitle("탈퇴 예정자 명단")
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
        .overlay(alignment: .bottom) {
            DeactivateButton(
                text: "선택한 사용자 계정 탈퇴") {
                    viewModel.updateIsShowingWithdrawAlert(isShowing: true)
                }
        }
        .bitgouelAlert(
            title: "선택한 사용자의 탈퇴를 \n승인 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isShowingWithdrawAlert,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.updateIsShowingWithdrawAlert(isShowing: false)
                },
                .init(text: "승인", style: .error) {
                    viewModel.withdrawUser {
                        viewModel.updateIsShowingWithdrawAlert(isShowing: false)
                        viewModel.onAppear()
                    }
                }
            ]
        )
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .bitgouelBottomSheet(isShowing: $viewModel.isPresentedUserCohortBottomSheet) {
            UserCohortBottomSheet(
                currentYear: viewModel.currentYear,
                selectedCohort: viewModel.selectedCohort,
                onCohortSelect: { cohort in
                    viewModel.selectedCohort = cohort
                    viewModel.onAppear()
                },
                cancel: { cancel in
                    viewModel.updateIsPresentedCohortBottomSheet(isPresented: cancel)
                }
            )
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingAdminPageBottomSheet) {
            AdminPageListBottomSheet(
                selectedPage: viewModel.selectedPage) { page in
                    viewModel.updateSelectedPage(page: page)
                    adminPageState.adminPageFlow = page
                } cancel: { cancel in
                    viewModel.updateIsShowingAdminPageBottomSheet(isShowing: cancel)
                }

        }
    }
}
