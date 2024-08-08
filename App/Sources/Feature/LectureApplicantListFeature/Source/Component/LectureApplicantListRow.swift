import SwiftUI
import Service

struct LectureApplicantListRow: View {
    let studentInfo: ApplicantInfoEntity
    @Binding var state: LectureApplicantListPageState
    @Binding var isSelected: Bool

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            completionStatusCheckButton()

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    BitgouelText(
                        text: studentInfo.name,
                        font: .text1
                    )

                    completionStatusText()
                }

                HStack(spacing: 4) {
                    Text(studentInfo.school)

                    Text("\(studentInfo.grade)학년 \(studentInfo.classNumber)반 \(studentInfo.number)번")
                }
                .bitgouelFont(.caption, color: .greyscale(.g4))

                Text(studentInfo.clubName)
                    .bitgouelFont(.caption, color: .greyscale(.g7))
            }
        }
    }

    @ViewBuilder
    func completionStatusCheckButton() -> some View {
        switch state {
        case .general:
            EmptyView()

        case .check:
            CheckButton(isSelected: $isSelected)
        }
    }

    @ViewBuilder
    func completionStatusText() -> some View {
        switch state {
        case .general:
            if studentInfo.isComplete {
                Text("이수완료")
                    .bitgouelFont(.caption, color: .primary(.p5))
            }

        case .check:
            EmptyView()
        }
    }
}
