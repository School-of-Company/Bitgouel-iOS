import SwiftUI

struct CheckButton: View {
    @Binding var isSelected: Bool

    public init(isSelected: Binding<Bool>) {
        _isSelected = isSelected
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(isSelected ? Color.bitgouel(.primary(.p5)) : Color.bitgouel(.greyscale(.g9)))
                .frame(width: 24, height: 24)
            
            if isSelected {
                BitgouelAsset.Icons.checkStroke.swiftUIImage
                    .resizable()
                    .frame(width: 12, height: 9)
            }
        }
        .buttonWrapper {
            self.isSelected.toggle()
        }
        .buttonStyle(PressedSelectionButtonStyle(isSelected: isSelected))
    }
}
