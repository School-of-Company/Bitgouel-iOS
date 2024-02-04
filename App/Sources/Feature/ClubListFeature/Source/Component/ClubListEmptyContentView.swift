import SwiftUI

struct ClubListEmptyContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            BitgouelAsset.Icons.exclamationmark.swiftUIImage
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.top, 196)
            
            Text("재학중인 학교에 취업 동아리가 없거나 \n등록되어있지 않습니다.")
                .foregroundColor(.bitgouel(.greyscale(.g7)))
                .padding(.top, 24)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}
