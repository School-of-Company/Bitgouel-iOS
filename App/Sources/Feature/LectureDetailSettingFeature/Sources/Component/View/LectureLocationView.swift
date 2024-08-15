import SwiftUI

struct LectureLocationView: View {
    @Binding var isShowingPostCodeSheet: Bool
    @Binding var address: String
    @Binding var locationDetail: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "강의 장소",
                font: .text1
            )

            PickerTextField(
                "지번, 도로명 주소 검색",
                text: address
            ) {
                isShowingPostCodeSheet = true
            }

            BitgouelTextField(
                "상세 주소 입력",
                text: $locationDetail
            )
        }
    }
}
