import SwiftUI

struct EssentialCompleteView: View {
    @Binding var isComplete: Bool
    let onSelectButton: (Bool) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            BitgouelText(
                text: "필수 수강 여부",
                font: .text1
            )

            HStack(spacing: 16) {
                TypeSelectedButton(
                    text: "필수",
                    isSelected: Binding(
                        get: { isComplete == true },
                        set: { isSelected in
                            if isSelected {
                                onSelectButton(isSelected)
                            } else {
                                isComplete = isSelected
                            }
                        }
                    )
                )

                TypeSelectedButton(
                    text: "선택",
                    isSelected: Binding(
                        get: { isComplete == false },
                        set: { isSelected in
                            if isSelected {
                                isComplete = false
                                onSelectButton(false
                                )
                            } else {
                                isComplete = true
                            }
                        }
                    )
                )
            }
        }
    }
}


