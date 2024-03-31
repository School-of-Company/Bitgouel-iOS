import Service
import SwiftUI

struct LoginView: View {
    private enum FocusField {
        case email
        case password
    }

    @EnvironmentObject var sceneState: SceneState
    @Environment(\.tabbarHidden) var tabbarHidden
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: LoginViewModel
    private let signupFactory: any SignUpFactory
    private let findPasswordFactory: any FindPasswordFactory

    init(
        viewModel: LoginViewModel,
        signupFactory: any SignUpFactory,
        findPasswordFactory: any FindPasswordFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupFactory = signupFactory
        self.findPasswordFactory = findPasswordFactory
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
                        isError: viewModel.isEmailErrorOccured, onLink: {
                            focusField = .password
                        }
                    )
                    .textContentType(.emailAddress)
                    .focused($focusField, equals: .email)

                    SecureBitgouelTextField(
                        "비밀번호",
                        text: $viewModel.password,
                        helpMessage: viewModel.passwordHelpMessage,
                        link: "비밀번호 찾기",
                        isError: viewModel.isPasswordErrorOcuured,
                        linkAction: {
                            viewModel.updateIsPresentedFindPasswordPage(isPresented: true)
                        }
                    )
                    .textContentType(.password)
                    .focused($focusField, equals: .password)
                }
                .padding(.top, 80)
                .padding(.horizontal, 28)

                Spacer()

                VStack(spacing: 8) {
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

                    HStack(spacing: 12) {
                        Button {
                            viewModel.signupPageIsRequired()
                        } label: {
                            Text("회원가입")
                                .bitgouelFont(.text3, color: .primary(.p5))
                        }

                        Divider()
                            .frame(height: 20)

                        Button {
                            sceneState.sceneFlow = .main
                        } label: {
                            Text("게스트 보기")
                                .bitgouelFont(.text3, color: .greyscale(.g4))
                        }
                    }
                }
                .padding(.bottom, 52)
            }
            .navigate(
                to: signupFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedSignupPage },
                    set: { _ in viewModel.signupPageDismissed() }
                )
            )
            .onChange(of: viewModel.isSuccessSignin) { newValue in
                guard newValue else { return }
                sceneState.sceneFlow = .main
            }
            .navigate(
                to: findPasswordFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedFindPasswordPage },
                    set: { isPresented in
                        viewModel.updateIsPresentedFindPasswordPage(isPresented: isPresented)
                    }
                )
            )
            .onChange(of: viewModel.isPresentedFindPasswordPage) { newValue in
                sceneState.sceneFlow = .findPassword
                tabbarHidden.wrappedValue = newValue
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
