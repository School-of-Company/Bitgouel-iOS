import SwiftUI

struct SuccessSignUpView: View {
    var body: some View {
        VStack {
            BitgouelAsset.Icons.check.swiftUIImage
                .padding(.top, 233)

            Text("회원가입 완료")
                .bitgouelFont(.title2)
                .padding(.top, 24)

            Text("관리자의 승인을 기다려주세요!")
                .bitgouelFont(.text3, color: .greyscale(.g4))

            Spacer()

            BitgouelButton(
                text: "돌아가기"
            )
            .cornerRadius(8)
            .padding(.horizontal, 28)
            .padding(.bottom, 46)
        }
    }
}
