import SwiftUI

struct InputDepartmentView: View {
    @Environment(\.dismiss) var dismiss
    @State var department: String = ""
    let registeredDepartment: (String) -> Void

    var body: some View {
        VStack {
            BitgouelTextField(
                "학과 이름 입력",
                text: $department
            )
            .padding(.top, 32)

            Spacer()

            ActivateButton(
                text: "학과 등록",
                buttonType: .add
            ) {
                registeredDepartment(department)
                dismiss()
            }
        }
        .padding(.horizontal, 28)
        .navigationTitle("학과 등록")
    }
}
