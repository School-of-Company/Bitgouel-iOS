import SwiftUI

struct SelectEssentialView: View {
    @Binding var isEssential: Bool
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
                        get: { isEssential == true },
                        set: { isSelected in
                            if isSelected {
                                onSelectButton(isSelected)
                            } else {
                                isEssential = isSelected
                            }
                        }
                    )
                )

                TypeSelectedButton(
                    text: "선택",
                    isSelected: Binding(
                        get: { isEssential == false },
                        set: { isSelected in
                            if isSelected {
                                isEssential = false
                                onSelectButton(
                                    false
                                )
                            } else {
                                isEssential = true
                            }
                        }
                    )
                )
            }
        }
    }
}
