import Service
import SwiftUI

struct LectureLineBottomSheet: View {
    var selectedLine: String
    @Binding var keyword: String
    @State var isSelected: Bool = false
    let lineList: [String]
    let lineSelect: (String) -> Void

    var body: some View {
        VStack(spacing: 8) {
            SearchTextField(
                text: $keyword,
                "강의 계열 검색"
            )

            ScrollView(showsIndicators: false) {
                if lineList.isEmpty {
                    HStack {
                        VStack(alignment: .leading) {
                            BitgouelText(
                                text: keyword,
                                font: .text2
                            )

                            Text("새 계열 추가하기")
                                .bitgouelFont(.caption, color: .greyscale(.g4))
                        }

                        Spacer()

                        BitgouelRadioButton(
                            isSelected: Binding(
                                get: { isSelected },
                                set: { selected in
                                    if selected {
                                        isSelected = selected
                                        lineSelect(keyword)
                                    } else {
                                        isSelected = selected
                                    }
                                }
                            )
                        )
                    }
                    .onTapGesture {
                        lineSelect(keyword)
                    }
                    .padding(.vertical, 24)
                } else {
                    LazyVStack(alignment: .leading) {
                        ForEach(lineList, id: \.self) { line in
                            lectureLineRow(
                                line: line,
                                isSelected: Binding(
                                    get: { line == selectedLine },
                                    set: { _ in lineSelect(line) }
                                )
                            )
                            .onTapGesture {
                                lineSelect(line)
                            }
                        }
                    }
                }
            }
        }
        .frame(height: 400)
        .padding(.horizontal, 28)
    }

    @ViewBuilder
    func lectureLineRow(
        line: String,
        isSelected: Binding<Bool>
    ) -> some View {
        HStack {
            BitgouelText(
                text: line,
                font: .text1
            )

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .id(line)
        .padding(.vertical, 24)
    }
}
