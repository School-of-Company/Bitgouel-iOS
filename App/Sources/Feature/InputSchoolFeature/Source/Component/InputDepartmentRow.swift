import SwiftUI

struct InputDepartmentRow: View {
    @Binding var text: String
    let deleteAction: () -> Void

    var body: some View {
        HStack(alignment: .center) {
            BitgouelTextField(
                "학과명 입력",
                text: $text
            )

            Button {
                deleteAction()
            } label: {
                BitgouelAsset.Icons.minusFill.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.bitgouel(.error(.e5)))
                    .frame(width: 24, height: 24)
            }
        }
    }
}
