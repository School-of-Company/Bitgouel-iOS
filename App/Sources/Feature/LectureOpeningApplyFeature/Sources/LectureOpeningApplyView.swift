import SwiftUI

struct LectureOpeningApplyView: View {
    @StateObject var viewModel: LectureOpeningApplyViewModel
    @State private var lectureDetailSettings: Bool = false

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                TextEditor(text: $viewModel.lectureTitle)
                    .bitgouelFont(.title3)
                    .frame(minHeight: 40, maxHeight: .infinity)
                    .fixedSize(horizontal: false, vertical: true)

                if viewModel.lectureTitle.isEmpty {
                    Text("강의 제목 (100자 이내)")
                        .bitgouelFont(.title3)
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                        .padding(EdgeInsets(top: 8, leading: 4, bottom: 0, trailing: 0))
                }
            }

            Divider()

            ZStack(alignment: .topLeading) {
                TextEditor(text: $viewModel.lectureText)
                    .bitgouelFont(.text2)
                    .frame(minHeight: 40, maxHeight: .infinity)
                    .lineSpacing(10)

                if viewModel.lectureText.isEmpty {
                    Text("본문 입력 (1000자 이내)")
                        .bitgouelFont(.text2)
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                        .padding(EdgeInsets(top: 16, leading: 4, bottom: 0, trailing: 0))
                }
            }
            
            VStack {
                Button {} label: {
                    Spacer()

                    Image("setting")

                    Text("활동 세부 설정")
                        .bitgouelFont(.text1, color: .primary(.p5))

                    Spacer()
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.bitgouel(.primary(.p5)))
                }

                BitgouelButton(
                    text: "강의 개설 신청",
                    style: .primary
                )
                .padding(.bottom, 14)
                .disabled(true)
            }
        }
        .padding(.horizontal, 28)
    }
}
