import SwiftUI

struct LectureApplicantListRow: View {
    let studentID: String
    let email: String
    let name: String
    let grade: Int
    let classNumber: Int
    let number: Int
    let cohort: Int
    let phoneNumber: String
    let schoolName: String
    let clubName: String
    @State var isSelected: Bool = false
    let checkStudent: (String) -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            CheckButton(
                isSelected: Binding(
                    get: { isSelected },
                    set: { selected in
                        if selected {
                            isSelected = selected
                            checkStudent(studentID)
                        } else {
                            isSelected = selected
                        }
                    }
                )
            )

            VStack(alignment: .leading, spacing: 4) {
                BitgouelText(
                    text: "\(grade)학년 \(classNumber)반 \(number)번 \(cohort)기 \(name)",
                    font: .text1
                )

                Group {
                    Text("\(phoneNumber) | \(email)")

                    Text(schoolName)

                    Text(clubName)
                }
                .bitgouelFont(.caption, color: .greyscale(.g7))
            }
        }
    }
}
