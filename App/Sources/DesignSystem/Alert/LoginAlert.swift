import SwiftUI

public extension View {
    func loginAlert(
        isShowing: Binding<Bool>
    ) -> some View {
        modifier(
            LoginAlertModifier(
                isShowing: isShowing
            )
        )
    }
}

struct LoginAlertModifier: ViewModifier {
    @Binding var isShowing: Bool
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var sceneState: SceneState

    public init(
        isShowing: Binding<Bool>
    ) {
        _isShowing = isShowing
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            if isShowing {
                Color.bitgouel(.greyscale(.g0))
                    .opacity(0.25)
                    .ignoresSafeArea()

                bitgouelAlert()
                    .padding(29)
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.move(edge: .bottom),
                            removal: .move(edge: .bottom).combined(with: .opacity)
                        )
                    )
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: isShowing ? 0.7 : 0.6, blendDuration: 40), value: isShowing)
    }

    @ViewBuilder
    func bitgouelAlert() -> some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 16) {
                Text("로그인 하시겠습니까?")
                    .bitgouelFont(.text1)

                Text("게스트 상태로는 홈 페이지만 볼 수 있습니다.\n다른 기능을 이용하기 위해선\n로그인 혹은 회원가입을 진행해주세요.")
                    .bitgouelFont(.caption, color: .greyscale(.g4))
                    .lineSpacing(3)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)

            HStack {
                CTAButton(
                    text: "취소",
                    style: .cancel,
                    action: {
                        sceneState.sceneFlow = .login
                    }
                )

                CTAButton(
                    text: "로그인",
                    style: .default,
                    action: {
                        sceneState.sceneFlow = .login
                    }
                )
            }
        }
        .padding(.top, 16)
        .background(Color.bitgouel(.greyscale(.g10)))
        .cornerRadius(8)
    }
}
