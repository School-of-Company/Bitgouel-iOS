import SwiftUI

struct SelectedLectureDetailButton: View {
    var text: String
    @Binding var isSelected: Bool

    public init(
        text: String,
        isSelected: Binding<Bool>
    ) {
        self.text = text
        _isSelected = isSelected
    }

    public var body: some View {
        Button {
            self.isSelected.toggle()
        } label: {
            BitgouelText(
                text: text,
                font: .text1
            )
            .foregroundColor(isSelected ? Color.bitgouel(.greyscale(.g10)) : Color.bitgouel(.greyscale(.g4)))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .overlay {
                RoundedRectangle(cornerRadius: 99)
                    .strokeBorder(isSelected ? Color.bitgouel(.primary(.p5)) : Color.bitgouel(.greyscale(.g4)))
            }
            .background(isSelected ? Color.bitgouel(.primary(.p5)) : .white)
            .cornerRadius(99)
        }
    }
}
