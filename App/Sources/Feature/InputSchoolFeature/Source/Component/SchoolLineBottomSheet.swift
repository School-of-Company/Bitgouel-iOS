import SwiftUI
import Service

public struct SchoolLineBottomSheet: View {
    let selectedLine: LineType?
    let lineList: [LineType] = LineType.allCases
    let cancel: (Bool) -> Void
    let selectLine: (LineType) -> Void

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                BitgouelText(
                    text: "계열",
                    font: .title3
                )

                Spacer()

                Button {
                    cancel(false)
                } label: {
                    BitgouelAsset.Icons.cancel.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.bitgouel(.greyscale(.g4)))
                        .frame(width: 24, height: 24)
                }
            }

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(lineList, id: \.self) { line in
                        HStack {
                            BitgouelText(
                                text: line.display(),
                                font: .text2
                            )

                            Spacer()

                            BitgouelRadioButton(
                                isSelected: Binding(
                                    get: { line == selectedLine },
                                    set: { _ in selectLine(line) }
                                )
                            )
                        }
                        .padding(.vertical, 24)
                    }
                }
            }
        }
        .padding(.horizontal, 28)
    }
}
