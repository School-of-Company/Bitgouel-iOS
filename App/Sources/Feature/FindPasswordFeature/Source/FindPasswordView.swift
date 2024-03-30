import SwiftUI

struct FindPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sceneState: SceneState
    @StateObject var viewModel: FindPasswordViewModel

    private let newPasswordFactory: any NewPasswordFactory

    init(
        viewModel: FindPasswordViewModel,
        newPasswordFactory: any NewPasswordFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.newPasswordFactory = newPasswordFactory
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading) {
                    BitgouelText(
                        text: "비밀번호 찾기",
                        font: .title2
                    )

                    BitgouelText(
                        text: "이메일 인증을 진행합니다.",
                        font: .text3
                    )
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                }
                .padding(.top, 24)

                BitgouelTextField(
                    "이메일",
                    text: Binding(
                        get: { viewModel.email },
                        set: { email in
                            viewModel.updateEmail(email: email)
                        }
                    )
                )
                .padding(.top, 32)

                Spacer()

                BitgouelButton(
                    text: "다음으로",
                    action: {
                        viewModel.updateIsPresentedSendEmailPage(isPresented: true)
                        viewModel.nextToButtonDidTap()
                    }
                )
                .disabled(viewModel.isEmailEmpty)
                .padding(.bottom, 20)
            }
            .bitgouelBackButton(dismiss: dismiss) {
                sceneState.sceneFlow = .login
            }
            .padding(.horizontal, 28)
            .navigate(
                to: SendEmailView(
                    email: viewModel.email,
                    nextToButtonAction: {
                        viewModel.nextToButtonAction()
                    }
                ),
                when: Binding(
                    get: { viewModel.isPresentedSendEmailPage },
                    set: { isPresented in
                        viewModel.updateIsPresentedSendEmailPage(isPresented: isPresented)
                    }
                )
            )
            .navigate(
                to: newPasswordFactory.makeView(email: viewModel.email).eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedNewPasswordPage },
                    set: { isPresented in
                        viewModel.updateIsPresentedNewPasswordPage(isPresented: isPresented)
                    }
                )
            )
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
