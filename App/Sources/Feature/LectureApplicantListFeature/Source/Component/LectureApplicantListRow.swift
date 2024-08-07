import SwiftUI

struct LectureApplicantListRow: View {
    let studentID: String
    let name: String
    let grade: Int
    let classNumber: Int
    let number: Int
    let schoolName: String
    let clubName: String
    @State var isComplete: Bool
    let onSelectedStudent: (Bool, String) -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            CheckButton(
                isSelected: Binding(
                    get: { isComplete },
                    set: { isSelected in
                        if isSelected {
                            isComplete = isSelected
                            onSelectedStudent(isSelected, studentID)
                        } else {
                            isComplete = isSelected
                            onSelectedStudent(isSelected, studentID)
                        }
                    }
                )
            )

            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "\(grade)학년 \(classNumber)반 \(number)번 \(name)",
                    font: .text1
                )

                Group {
                    Text(schoolName)

                    Text(clubName)
                }
                .bitgouelFont(.caption, color: .greyscale(.g7))
            }
        }
    }
}
