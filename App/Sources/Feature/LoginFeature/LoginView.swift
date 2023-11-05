import SwiftUI

struct LoginView: View {
    private enum FocusField {
        case email
        case password
    }
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: LoginViewModel
    
    public init(
        viewModel: LoginViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
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
                    text: "로그인"
                )
                .cornerRadius(8)
                .disabled(viewModel.isFormEmpty)
                .padding(.horizontal, 28)
                
                Text("또는")
                    .bitgouelFont(.caption, color: .greyscale(.g7))
                    .padding(.top, 8)
                
                Text("회원가입")
                    .bitgouelFont(.text3, color: .primary(.p5))
                    .padding(.top, 2)
            }
            .frame(height: 104)
            .padding(.bottom, 46)
        }
    }
}
