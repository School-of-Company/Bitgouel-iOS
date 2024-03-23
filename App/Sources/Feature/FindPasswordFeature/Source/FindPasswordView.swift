import SwiftUI

struct FindPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: FindPasswordViewModel

    init(viewModel: FindPasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
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
                style: .primary,
                action: {
                    viewModel.updateIsPresentedSendEmailPage(isPresented: true)
                    viewModel.nextToButtonDidTap()
                }
            )
            .padding(.bottom, 20)
        }
        .bitgouelBackButton(dismiss: dismiss)
        .padding(.horizontal, 28)
        .navigate(
            to: SendEmailView(email: viewModel.email),
            when: Binding(
                get: { viewModel.isPresentedSendEmailPage },
                set: { isPresented in
                    viewModel.updateIsPresentedSendEmailPage(isPresented: isPresented)
                }
            )
        )
    }
}
