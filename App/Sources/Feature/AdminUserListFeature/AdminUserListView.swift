import SwiftUI

struct AdminUserListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: AdminUserListViewModel
    
    var body: some View {
        ZStack {
        VStack(spacing: 0) {
            HStack(spacing: 24) {
                BitgouelText(
                    text: viewModel.titleText,
                    font: .title2
                )
                
                Spacer()
                
                switch viewModel.type {
                case .default:
                    registerListButton()
                    
                    withdrawListButton()
                case .register:
                    userListButton()
                    
                    withdrawListButton()
                case .withdraw:
                    userListButton()
                    
                    registerListButton()
                }
            }
            
            HStack(spacing: 10) {
                switch viewModel.type {
                case .default:
                    UserNameSearchTextField(
                        text: $viewModel.searchName
                    ) {}
                    
                    BitgouelAsset.Icons.filterStroke.swiftUIImage
                        .padding(.horizontal, 10)
                        .padding(.vertical, 15)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.bitgouel(.greyscale(.g7)))
                        }
                        .onTapGesture {
                            viewModel.isPresentedUserTypeFilter = true
                        }
                case .register:
                    OptionButton(
                        buttonText: "전체 선택",
                        textColor: .bitgouel(.greyscale(.g6)),
                        strokeColor: .bitgouel(.greyscale(.g6)),
                        backgroundColor: .bitgouel(.greyscale(.g10))
                    )
                    
                    OptionButton(
                        buttonText: "선택 수락",
                        textColor: .bitgouel(.primary(.p5)),
                        strokeColor: .bitgouel(.primary(.p5)),
                        backgroundColor: .bitgouel(.greyscale(.g10))
                    ) {
                        viewModel.isAppeove = true
                    }
                    
                    OptionButton(
                        buttonText: "선택 거절",
                        textColor: .bitgouel(.error(.e5)),
                        strokeColor: .bitgouel(.error(.e5)),
                        backgroundColor: .bitgouel(.greyscale(.g10))
                    ) {
                        viewModel.isReject = true
                    }
                case .withdraw:
                    OptionButton(
                        buttonText: "선택 탈퇴",
                        textColor: .bitgouel(.error(.e5)),
                        strokeColor: .bitgouel(.error(.e5)),
                        backgroundColor: .bitgouel(.greyscale(.g10))
                    ) {
                        viewModel.isWithdraw = true
                    }
                    
                    OptionButton(
                        buttonText: "전체 탈퇴",
                        textColor: .bitgouel(.greyscale(.g10)),
                        strokeColor: .bitgouel(.error(.e5)),
                        backgroundColor: .bitgouel(.error(.e5))
                    ) {
                        viewModel.isWithdraw = true
                    }
                    
                    HStack {
                        BitgouelAsset.Icons.filter.swiftUIImage
                        
                        BitgouelText(
                            text: "필터",
                            font: .text3
                        )
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g6)))
                    .padding(.horizontal, 23)
                    .padding(.vertical, 12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.bitgouel(.greyscale(.g6)))
                    }
                    .onTapGesture {
                        viewModel.isPresentedUserCohortFilter = true
                    }
                }
            }
            .padding(.top, 24)
            
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(0..<1) { _ in
                    HStack(spacing: 8) {
                        switch viewModel.type {
                        case .register, .withdraw:
                            CheckButton(isSelected: $viewModel.isSelectedUserList)
                        case .default:
                            EmptyView()
                        }
                        
                        BitgouelText(
                            text: "홍길동",
                            font: .text1
                        )
                        
                        BitgouelText(
                            text: "학생",
                            font: .text1
                        )
                        .foregroundColor(.bitgouel(.greyscale(.g6)))
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .padding(.vertical, 14)
                }
            }
            .padding(.top, 24)
            
            Spacer()
        }
        .padding(.horizontal, 28)
            ZStack(alignment: .center) {
                if viewModel.isPresentedUserTypeFilter {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    
                    UserTypeFilterPopup(
                        userAuthorityType: viewModel.userAuthorityType,
                        selectedAuthority: viewModel.selectedAuthority
                    ) { authority in
                        viewModel.selectedAuthority = authority
                    } cancel: { cancel in
                        viewModel.updateIsPresentedUserTypeFilter(isPresented: cancel)
                    }
                    .padding(.horizontal, 28)
                    
                }
                
                if viewModel.isPresentedUserCohortFilter {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    
                    UserCohortFilterPopup(
                        cohortList: viewModel.cohortList,
                        selectedCohort: viewModel.selectedCohort
                    ) { cohort in
                        viewModel.selectedCohort = cohort
                    } cancel: { cancel in
                        viewModel.updateIsPresentedCohortFilter(isPresented: cancel)
                    }
                    .padding(.horizontal, 28)

                }
            }
        }
        .onReceive(viewModel.objectWillChange) { _ in
            if viewModel.isPresentedDefaultList {
                viewModel.type = .default
            }
            
            if viewModel.isPresentedRegisterList {
                viewModel.type = .register
            }
            
            if viewModel.isPresentedWithdrawList {
                viewModel.type = .withdraw
            }
        }
        .bitgouelAlert(
            title: "가입을 수락 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isAppeove,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isAppeove = false
                },
                .init(text: "수락", style: .default) {}
            ]
        )
        .bitgouelAlert(
            title: "가입을 거절 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isReject,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isReject = false
                },
                .init(text: "거절", style: .error) {}
            ]
        )
        .bitgouelAlert(
            title: "탈퇴를 승인 하시겠습니까?",
            description: "",
            isShowing: $viewModel.isWithdraw,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isWithdraw = false
                },
                .init(text: "승인", style: .error)
            ]
        )
    }
    
    @ViewBuilder
    func OptionButton(
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
        .padding(.horizontal, 23)
        .padding(.vertical, 12)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(strokeColor)
        }
        .buttonWrapper(action)
        .background(backgroundColor)
        .cornerRadius(8)
    }
    
    @ViewBuilder
    func userListButton() -> some View {
        BitgouelAsset.Icons.people.swiftUIImage
            .onTapGesture {
                viewModel.updateDefaultType()
            }
    }
    
    @ViewBuilder
    func registerListButton() -> some View {
        BitgouelAsset.Icons.addFill.swiftUIImage
            .onTapGesture {
                viewModel.updateRegisterType()
            }
    }
    
    @ViewBuilder
    func withdrawListButton() -> some View {
        BitgouelAsset.Icons.minusFill.swiftUIImage
            .onTapGesture {
                viewModel.updateWithdrawType()
            }
    }
}
