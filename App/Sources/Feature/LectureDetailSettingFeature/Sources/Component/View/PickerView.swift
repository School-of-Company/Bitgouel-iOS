import SwiftUI

struct PickerView: View {
    var selectedLine: String
    var selectedDepartment: String
    var selectedInstructorName: String
    let onSelectLine: () -> Void
    let onSelectDepartment: () -> Void
    let onSelectInstructor: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "강의 계열",
                    font: .text1
                )

                PickerTextField(
                    "강의 선택",
                    text: selectedLine
                ) {
                    onSelectLine()
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "학과",
                    font: .text1
                )

                PickerTextField(
                    "학과 선택",
                    text: selectedDepartment
                ) {
                    onSelectDepartment()
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                BitgouelText(
                    text: "담당 교수",
                    font: .text1
                )

                PickerTextField(
                    "담당 교수 선택",
                    text: selectedInstructorName
                ) {
                    onSelectInstructor()
                }
            }
        }
    }
}
