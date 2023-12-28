import Service
import SwiftUI

struct LoginView: View {
    private enum FocusField {
        case email
        case password
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: LoginViewModel
    private let signupFactory: any StudentSignUpFactory

    init(
        viewModel: LoginViewModel,
        signupFactory: any StudentSignUpFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupFactory = signupFactory
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("빛고을\n직업교육\n혁신지구")
                        .bitgouelFont(.title1)

                    Spacer()
                }
                .frame(height: 108)
                .padding(.top, 53)
                .padding(.leading, 28)

                VStack {
                    BitgouelTextField(
                        "이메일",
                        text: $viewModel.email,
                        helpMessage: viewModel.emailHelpMessage,
                        isError: viewModel.isEmailErrorOccured
                    ) {
                        focusField = .password
                    }
                    .textContentType(.emailAddress)
                    .focused($focusField, equals: .email)

                    SecureBitgouelTextField(
                        "비밀번호",
                        text: $viewModel.password,
                        helpMessage: viewModel.passwordHelpMessage,
                        link: "비밀번호 찾기",
                        isError: viewModel.isPasswordErrorOcuured
                    )
                    .textContentType(.password)
                    .focused($focusField, equals: .password)
                }
                .padding(.top, 80)
                .padding(.horizontal, 28)

                Spacer()

                VStack(spacing: 0) {
                    BitgouelButton(
                        text: "로그인",
                        action: {
                            viewModel.login()
                        }
                    )
                    .cornerRadius(8)
                    .disabled(viewModel.isFormEmpty)
                    .padding(.horizontal, 28)

                    Text("또는")
                        .bitgouelFont(.caption, color: .greyscale(.g7))
                        .padding(.top, 8)

                    Button {
                        viewModel.signupPageIsRequired()
                    } label: {
                        Text("회원가입")
                            .bitgouelFont(.text3, color: .primary(.p5))
                            .padding(.top, 2)
                    }
                }
                .padding(.bottom, 46)
                .navigate(
                    to: signupFactory.makeView().eraseToAnyView(),
                    when: Binding(
                        get: { viewModel.isPresentedSignupPage },
                        set: { _ in viewModel.signupPageDismissed() }
                    )
                )
            }
        }
    }
}
