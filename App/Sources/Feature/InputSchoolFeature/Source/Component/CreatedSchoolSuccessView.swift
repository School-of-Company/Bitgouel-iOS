import SwiftUI

struct CreatedClubSuccessView: View {
    let dismiss: () -> Void

    var body: some View {
        VStack {
            BitgouelAsset.Icons.check.swiftUIImage
                .padding(.top, 233)

            Text("학교 등록 완료")
                .bitgouelFont(.title2)
                .padding(.top, 24)

            Text("새 학교를 등록했습니다.")
                .bitgouelFont(.text3, color: .greyscale(.g4))

            BitgouelButton(
                text: "돌아가기"
            ) {
                dismiss()
            }
            .cornerRadius(8)
            .padding(.horizontal, 28)
            .padding(.bottom, 46)
        }
        .navigationBarBackButtonHidden(true)
    }
}
