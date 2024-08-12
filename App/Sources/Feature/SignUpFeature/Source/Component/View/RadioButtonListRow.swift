import SwiftUI

public struct RadioButtonListRow: View {
    let element: String
    let selectedElement: String?
    let onElementSelect: (String) -> Void

    public var body: some View {
        HStack {
            BitgouelText(
                text: element,
                font: .text2
            )

            Spacer()

            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedElement == element },
                    set: { isSelected in
                        if isSelected {
                            onElementSelect(element)
                        }
                    }
                )
            )
        }
        .onTapGesture {
            onElementSelect(element)
        }
        .padding(.vertical, 24)
    }
}
