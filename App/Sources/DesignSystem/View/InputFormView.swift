import SwiftUI

struct InputFormView: View {
    let epic: String
    let state: String
    var settingButtonAction: () -> Void
    var finalButtonAction: () -> Void

    @Binding var title: String
    @Binding var text: String

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                TextEditor(text: Binding(
                    get: { title },
                    set: { newValue in
                        guard newValue.count <= 100 else { return }
                        title = newValue
                    }
                ))
                .bitgouelFont(.title3)
                .overlay(alignment: .topLeading) {
                    if title.isEmpty {
                        BitgouelText(
                            text: "\(epic) 제목 (100자 이내)",
                            font: .title3
                        )
                        .padding(.top, 8)
                        .padding(.leading, 4)
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                    }
                }
            }
            .frame(minHeight: 40, maxHeight: 120)

            Divider()

            VStack {
                TextEditor(text: Binding(
                    get: { text },
                    set: { newValue in
                        guard newValue.count <= 1000 else { return }
                        text = newValue
                    }
                ))
                .bitgouelFont(.text3)
                .overlay(alignment: .topLeading) {
                    if text.isEmpty {
                        BitgouelText(
                            text: "본문 입력 (1000자 이내)",
                            font: .text3
                        )
                        .padding(.top, 8)
                        .padding(.leading, 4)
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                    }
                }
            }
            .padding(.top, 16)
            .frame(height: 460)

            Divider()

            VStack(spacing: 8) {
                Button {
                    settingButtonAction()
                } label: {
                    Spacer()

                    BitgouelAsset.Icons.setting.swiftUIImage

                    Text("\(epic) 세부 설정")
                        .bitgouelFont(.text3, color: .primary(.p5))

                    Spacer()
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.bitgouel(.primary(.p5)))
                }

                BitgouelButton(
                    text: "\(epic) \(state)",
                    style: .primary
                ) {
                    finalButtonAction()
                }
                .cornerRadius(8)
            }
            .padding(.top, 24)
            .padding(.bottom, 12)
        }
        .padding(.horizontal, 24)
    }
}
