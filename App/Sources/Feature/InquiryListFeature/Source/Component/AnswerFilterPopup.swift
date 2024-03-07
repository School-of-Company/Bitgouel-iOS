import SwiftUI
import Service

struct AnswerStatusListPopup: View {
    let answerStatusList: [AnswerStatusType]
    var selectedAnswerStatus: AnswerStatusType
    var answerStatus: [AnswerStatusType]
    let onAnswerStatusSelect: ([AnswerStatusType]) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 204)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        BitgouelText(
                            text: "문의사항",
                            font: .title3
                        )

                        Spacer()

                        Button {
                            cancel(false)
                        } label: {
                            BitgouelAsset.Icons.cancel.swiftUIImage
                        }
                    }
                    .padding(.top, 24)

                    Spacer()

                    LazyVStack(spacing: 16) {
                        ForEach(answerStatusList, id: \.self) { status in
                            answerStatusListRow(
                                answerStatus: status,
                                selectedAnswerStatus: selectedAnswerStatus) { status in
                                    
                                }
                        }
                    }
                    .padding(.top, 32)

                    Spacer()
                }
            }
            .padding(.horizontal, 24)
    }

    @ViewBuilder
    func answerStatusListRow(
        answerStatus: AnswerStatusType,
        selectedAnswerStatus: AnswerStatusType,
        onAnswerStatusSelect: @escaping (AnswerStatusType) -> Void
    ) -> some View {
        HStack {
            CheckButton(
                isSelected: Binding(
                    get: { selectedAnswerStatus.rawValue == answerStatus.display() },
                    set: { value in
                        if value {
                            onAnswerStatusSelect(selectedAnswerStatus)
                        }
                    }
                )
            )

            Spacer()

            BitgouelText(
                text: answerStatus.display(),
                font: .text3
            )
        }
    }
}
