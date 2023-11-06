import SwiftUI

struct BitgouelRadioButton: View {
    @Binding var isSelected: Bool
    
    public init(isSelected: Binding<Bool>) {
        _isSelected = isSelected
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(isSelected ? Color.bitgouel(.primary(.p5)) : Color.bitgouel(.greyscale(.g7)), lineWidth: 2)
                .frame(width: 24, height: 24)
            
            Circle()
                .fill(isSelected ? Color.bitgouel(.primary(.p5)) : Color.clear)
                .frame(width: 14, height: 14)
        }
        .buttonWrapper {
            self.isSelected.toggle()
        }
        .buttonStyle(PressedSelectionButtonStyle(isSelected: isSelected))
    }
}
