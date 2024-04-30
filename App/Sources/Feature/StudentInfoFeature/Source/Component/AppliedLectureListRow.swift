import SwiftUI

struct AppliedLectureListRow: View {
    let name: String
    let lectureType: String
    let currentCompletedDate: Date?
    let instructor: String
    let isComplete: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("# \(lectureType)")
                .bitgouelFont(.caption, color: .primary(.p3))

            BitgouelText(
                text: name,
                font: .text2
            )

            HStack(spacing: 8) {
                Text(instructor)

                Divider()

                if isComplete {
                    if let currentCompletedDate {
                        Text("\(currentCompletedDate.toStringCustomFormat(format: "yyyy년 MM월 dd일")) 이수")
                    } else {}
                } else {
                    Text("미이수")
                }
            }
            .bitgouelFont(.caption, color: .greyscale(.g7))
        }
    }
}
