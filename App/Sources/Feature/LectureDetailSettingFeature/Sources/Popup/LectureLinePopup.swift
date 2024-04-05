import Service
import SwiftUI

struct LectureLinePopup: View {
    var lineList: [String]
    var selectedLine: String
    @Binding var keyword: String
    let division: DivisionType
    let onLineSelect: (String) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 480)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        BitgouelText(
                            text: "강의 계열",
                            font: .title3
                        )
                        
                        Spacer()
                        
                        Button {
                            cancel(false)
                        } label: {
                            BitgouelAsset.Icons.cancel.swiftUIImage
                        }
                    }
                    .padding(.top, 24)
                    
                    SearchTextField(
                        text: $keyword,
                        "계열 검색 또는 임의로 추가..."
                    )
                    .padding(.top, 24)
                    
                    Divider()
                        .padding(.top, 16)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            if lineList.isEmpty {
                                lectureLineRow(
                                    line: keyword,
                                    division: division,
                                    onLineSelect: onLineSelect
                                )
                                
                                Divider()
                            } else {
                                ForEach(lineList, id: \.self) { line in
                                    lectureLineRow(
                                        line: line,
                                        division: division,
                                        onLineSelect: onLineSelect
                                    )
                                    
                                    Divider()
                                }
                            }
                        }
                    }
                    .padding(.top, 24)
                }
                .padding(.horizontal, 24)
            }
            .padding(.horizontal, 28)
    }

    @ViewBuilder
    func lectureLineRow(
        line: String,
        division: DivisionType,
        onLineSelect: @escaping (String) -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            BitgouelText(
                text: line,
                font: .text1
            )
        }
        .padding(.leading, 16)
        .onTapGesture {
            onLineSelect(line)
        }
        .id(line)
    }
}
