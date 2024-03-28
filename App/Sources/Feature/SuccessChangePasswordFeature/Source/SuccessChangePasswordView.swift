import SwiftUI

struct SuccessChangePasswordView: View {
    @EnvironmentObject var sceneState: SceneState

    private let myPageFactory: any MyPageFactory

    init(
        myPageFactory: any MyPageFactory
    ) {
        self.myPageFactory = myPageFactory
    }

    var body: some View {
        VStack {
            BitgouelAsset.Icons.check.swiftUIImage
                .padding(.top, 233)

            Text("비밀번호 변경 완료")
                .bitgouelFont(.title2)
                .padding(.top, 24)

            Text("비밀번호 변경을 성공적으로 완료했습니다.")
                .bitgouelFont(.text3, color: .greyscale(.g4))

            Spacer()

            BitgouelButton(
                text: "돌아가기",
                action: {
                    sceneState.sceneFlow = .login
                }
            )
            .cornerRadius(8)
            .padding(.horizontal, 28)
            .padding(.bottom, 46)
        }
        .navigationBarBackButtonHidden(true)
    }
}
