import SwiftUI

struct NewPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NewPasswordViewModel

    init(viewModel: NewPasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                BitgouelText(
                    text: "비밀번호 변경",
                    font: .title2
                )

                BitgouelText(
                    text: "새 비밀번호를 설정합니다",
                    font: .text3
                )
                .foregroundColor(.bitgouel(.greyscale(.g4)))
            }
            .padding(.top, 24)

            VStack(alignment: .leading, spacing: 16) {
                BitgouelTextField(
                    "8~24자 이내 영문, 숫자, 특수문자 1개 이상",
                    text: Binding(
                        get: { viewModel.newPassword },
                        set: { password in
                            viewModel.updateNewPassword(password: password)
                        }
                    )
                )

                BitgouelTextField(
                    "비밀번호 확인",
                    text: Binding(
                        get: { viewModel.checkNewPassword },
                        set: { password in
                            viewModel.updateCheckNewPassword(password: password)
                        }
                    )
                )
            }
            .padding(.top, 32)

            Spacer()

            BitgouelButton(
                text: "다음으로",
                action: {
                    viewModel.nextToButtonDidTap()
                }
            )
            .disabled(viewModel.isPasswordEmpty)
            .padding(.bottom, 20)
        }
        .bitgouelBackButton(dismiss: dismiss)
        .padding(.horizontal, 28)
        .navigate(
            to: SuccessFindPasswordChangeView(),
            when: Binding(
                get: { viewModel.isPresentedSuccessFindPasswordPage },
                set: { isPresented in
                    viewModel.updateIsPresentedSuccessFindPasswordPage(isPresented: isPresented)
                }
            )
        )
    }
}
