import Service
import SwiftUI

struct LectureTypeBottomSheet: View {
    var selectedLectureType: LectureType
    let lectureTypeList: LectureType.AllCases
    let lectureTypeDidSelect: (LectureType) -> Void

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(lectureTypeList, id: \.self) { type in
                    lectureTypeListRow(
                        lectureType: type.rawValue,
                        isSelected: Binding(
                            get: { type.rawValue == selectedLectureType.rawValue },
                            set: { _ in lectureTypeDidSelect(type) }
                        )
                    )
                }
            }
        }
    }

    @ViewBuilder
    func lectureTypeListRow(
        lectureType: String,
        isSelected: Binding<Bool>
    ) -> some View {
        HStack {
            VStack(alignment: .leading) {
                BitgouelText(
                    text: lectureType,
                    font: .text2
                )

                if lectureType == "기타" {
                    Text("직접 작성하기")
                        .bitgouelFont(.caption, color: .greyscale(.g4))
                }
            }

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .id(String(lectureType))
        .padding(.horizontal, 28)
        .padding(.vertical, 24)
    }
}
