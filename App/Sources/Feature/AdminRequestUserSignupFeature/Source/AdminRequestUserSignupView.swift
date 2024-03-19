import SwiftUI

struct AdminRequestUserSignupView: View {
    @StateObject var viewModel: AdminRequestUserSignupViewModel
    
    private let adminUserListFactory: any AdminUserListFactory
    private let adminWithdrawUserListFactory: any AdminWithdrawUserListFactory
    
    init(
        viewModel: AdminRequestUserSignupViewModel
        adminUserListFactory: any AdminUserListFactory,
        adminWithdrawUserListFactory: any AdminWithdrawUserListFactory,
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.adminUserListFactory = adminUserListFactory
        self.adminWithdrawUserListFactory = adminWithdrawUserListFactory
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 24) {
                    BitgouelText(
                        text: "가입 요청자 명단",
                        font: .title2
                    )
                    
                    Spacer()
                    
                    BitgouelAsset.Icons.people.swiftUIImage
                        .onTapGesture {
                            viewModel.isNavigateUserListDidTap = true
                        }
                    
                    BitgouelAsset.Icons.minusFill.swiftUIImage
                        .onTapGesture {
                            viewModel.isNavigateWithdrawListDidTap = true
                        }
                }
                
                HStack(spacing: 10) {
                    OptionButton(
                        buttonText: "전체 선택",
                        foregroundColor: .bitgouel(.greyscale(.g6))
                    )
                    
                    OptionButton(
                        buttonText: "선택 수락",
                        foregroundColor: .bitgouel(.primary(.p5))
                    ) {
                        viewModel.isAppeove = true
                    }
                    
                    OptionButton(
                        buttonText: "선택 거절",
                        foregroundColor: .bitgouel(.error(.e5))
                    ) {
                        viewModel.isReject = true
                    }
                }
                .padding(.top, 24)
                
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<1) { _ in
                        HStack(spacing: 8) {
                            CheckButton(isSelected: $viewModel.isSelectedUserList)
                            
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
        }
        .navigate(
            to: adminUserListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateUserListDidTap },
                set: { _ in viewModel.userListPageDismissed() }
            )
        )
        .navigate(
            to: adminWithdrawUserListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateWithdrawListDidTap },
                set: { _ in viewModel.withdrawListPageDismissed() }
            )
        )
    }
    
    @ViewBuilder
    func OptionButton(
        buttonText: String,
        foregroundColor: Color,
        action: @escaping () -> Void = {}
    ) -> some View {
        BitgouelText(
            text: buttonText,
            font: .text3
        )
        .foregroundColor(foregroundColor)
        .padding(.horizontal, 23)
        .padding(.vertical, 12)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(foregroundColor)
        }
        .buttonWrapper(action)
        .cornerRadius(8)
    }
}
