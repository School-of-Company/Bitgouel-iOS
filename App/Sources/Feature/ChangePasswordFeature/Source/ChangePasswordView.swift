import SwiftUI

struct ChangePasswordView: View {
    @StateObject var viewModel: ChangePasswordViewModel

    private let successChangePasswordFactory: any SuccessChangePasswordFactory

    init(
        viewModel: ChangePasswordViewModel,
        successChangePasswordFactory: any SuccessChangePasswordFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.successChangePasswordFactory = successChangePasswordFactory
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 0) {
                BitgouelText(
                    text: "비밀번호 변경",
                    font: .title2
                )

                BitgouelText(
                    text: "본인확인 후 비밀번호를 변경해주세요!",
                    font: .text3
                )
            }

            VStack(spacing: 0) {
                BitgouelTextField(
                    "현재 비밀번호 입력",
                    text: $viewModel.currentPassword,
                    helpMessage: viewModel.currentPasswordHelpMessage,
                    isError: viewModel.isCurrentPasswordErrorOccurred
                )

                BitgouelTextField(
                    "새 비밀번호 입력",
                    text: $viewModel.newPassword,
                    helpMessage: viewModel.newPasswordHelpMessage,
                    isError: viewModel.isNewPasswordErrorOccurred
                )

                BitgouelTextField(
                    "새 비밀번호 확인",
                    text: $viewModel.checkNewPassword,
                    helpMessage: viewModel.newPasswordHelpMessage,
                    isError: viewModel.isNewPasswordErrorOccurred
                )

                Spacer()

                BitgouelButton(
                    text: "비밀번호 변경",
                    style: .primary
                ) {
                    viewModel.changePasswordButtonDidTap()
                }
            }
        }
        .padding(.horizontal, 28)
        .navigate(
            to: successChangePasswordFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedSuccessView },
                set: { isPresented in
                    viewModel.updateIsPresentedSuccessView(isPresented: isPresented)
                }
            )
        )
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .onTapGesture {
            hideKeyboard()
        }
        .onChange(of: viewModel.currentPassword) { _ in
            viewModel.updateIsCurrentPasswordErrorOccurred(isErrorOccurred: false)
        }
        .onChange(of: viewModel.newPassword) { _ in
            viewModel.updateIsNewPasswordErrorOccurred(isErrorOccurred: false)
        }
        .onChange(of: viewModel.checkNewPassword) { _ in
            viewModel.updateIsNewPasswordErrorOccurred(isErrorOccurred: false)
        }
    }
}
