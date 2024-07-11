import SwiftUI

struct WithdrawUserListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: WithdrawUserListViewModel

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
                                        viewModel.updateIsShowingWithdrawAlert(isShowing: isSelected)
                                    } else {
                                        viewModel.removeAllUserList()
                                        viewModel.updateIsShowingWithdrawAlert(isShowing: isSelected)
                                    }
                                }
                            )
                        )
                    }

                    Spacer()
                }

                Divider()

                HStack(spacing: 10) {
                    optionButton(
                        buttonText: "선택 탈퇴",
                        textColor: .bitgouel(.error(.e5)),
                        strokeColor: .bitgouel(.error(.e5)),
                        backgroundColor: .bitgouel(.greyscale(.g10))
                    ) {
                        viewModel.isShowingWithdrawAlert = true
                    }

                    optionButton(
                        buttonText: "전체 탈퇴",
                        textColor: .bitgouel(.greyscale(.g10)),
                        strokeColor: .bitgouel(.error(.e5)),
                        backgroundColor: .bitgouel(.error(.e5))
                    ) {
                        if viewModel.isShowingWithdrawAlert {
                            viewModel.isShowingWithdrawAlert = false
                        } else {
                            viewModel.isShowingWithdrawAlert = true
                        }
                    }

                    HStack {
                        BitgouelAsset.Icons.filter.swiftUIImage

                        BitgouelText(
                            text: "필터",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 9)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.bitgouel(.greyscale(.g4)))
                    }
                    .onTapGesture {
                        viewModel.updateIsPresentedCohortBottomSheet(isPresented: true)
                    }
                }
                .padding(.top, 24)

                ScrollView {
                    if viewModel.userList.isEmpty {
                        NoInfoView(text: "탈퇴 예정자가 없어요")
                    } else {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ForEach(viewModel.userList, id: \.userID) { userInfo in
                                HStack(spacing: 8) {
                                    CheckButton(
                                        isSelected: Binding(
                                            get: { viewModel.selectedWithdrawUserList.contains(userInfo.userID) },
                                            set: { isSelected in
                                                viewModel.insertUserList(userID: userInfo.userID)
                                                if !isSelected {
                                                    viewModel.removeUserList(userID: userInfo.userID)
                                                }
                                            }
                                        )
                                    )

                                    BitgouelText(
                                        text: userInfo.name,
                                        font: .text1
                                    )
                                }

                                Divider()
                                    .frame(height: 1)
                                    .padding(.vertical, 14)
                            }
                        }
                    }
                }
                .padding(.top, 24)

                Spacer()
            }
            .padding(.horizontal, 28)
        }
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("탈퇴 예정자 명단")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.isNavigateUserListDidTap = true
                } label: {
                    BitgouelAsset.Icons.people.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }

                Button {
                    viewModel.isNavigateRequestSignUpDidTap = true
                } label: {
                    BitgouelAsset.Icons.addFill.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .bitgouelAlert(
            title: "선택한 사용자의 탈퇴를 \n승인 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isShowingWithdrawAlert,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isShowingWithdrawAlert = false
                    viewModel.removeAllUserList()
                },
                .init(text: "승인", style: .error) {
                    viewModel.withdrawUser()
                    viewModel.isShowingWithdrawAlert = false
                }
            ]
        )
        .navigate(
            to: userListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateUserListDidTap },
                set: { _ in viewModel.userListPageDismissed() }
            )
        )
        .navigate(
            to: requestUserSignupFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateRequestSignUpDidTap },
                set: { _ in viewModel.requestSignUpPageDismissed() }
            )
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
    }

    @ViewBuilder
    func optionButton(
        buttonText: String,
        textColor: Color,
        strokeColor: Color,
        backgroundColor: Color,
        action: @escaping () -> Void = {}
    ) -> some View {
        BitgouelText(
            text: buttonText,
            font: .text3
        )
        .foregroundColor(textColor)
        .padding(.horizontal, 20)
        .padding(.vertical, 9)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(strokeColor)
        }
        .buttonWrapper(action)
        .background(backgroundColor)
        .cornerRadius(8)
    }
}
