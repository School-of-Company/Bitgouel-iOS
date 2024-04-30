import SwiftUI

struct LectureApplicantListRow: View {
    let studentID: String
    @State var selectedStudentID: String
    let email: String
    let name: String
    let grade: Int
    let classNumber: Int
    let number: Int
    let cohort: Int
    let phoneNumber: String
    let schoolName: String
    let clubName: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            CheckButton(
                isSelected: Binding(
                    get: { studentID == selectedStudentID },
                    set: { isSelected in
                        if isSelected {
                            selectedStudentID = studentID
                        } else {
                            selectedStudentID = ""
                        }
                    }
                )
            )

            VStack(alignment: .leading, spacing: 8) {
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
