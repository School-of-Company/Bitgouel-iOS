import Service
import SwiftUI

public struct FieldBottomSheet: View {
    let fieldList: [FieldType] = FieldType.allCases
    let selectedField: FieldType?
    @State var keyword: String = ""
    let selecteField: (FieldType) -> Void

    public var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(fieldList, id: \.self) { field in
                    fieldRow(
                        field: field.display(),
                        isSelected: Binding(
                            get: { selectedField == field },
                            set: { _ in selecteField(field) }
                        )
                    )
                    .onTapGesture { selecteField(field) }
                }
            }
        }
        .padding(.horizontal, 28)
    }

    @ViewBuilder
    func fieldRow(field: String, isSelected: Binding<Bool>) -> some View {
        HStack {
            BitgouelText(
                text: field,
                font: .text2
            )

            Spacer()

            BitgouelRadioButton(isSelected: isSelected)
        }
        .padding(.vertical, 24)
    }
}
