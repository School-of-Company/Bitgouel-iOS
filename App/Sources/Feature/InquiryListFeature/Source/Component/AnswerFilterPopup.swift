import Service
import SwiftUI

enum AnswerList: String, CaseIterable {
    case all = "전체"
    case answer = "답변 된 문의사항만"
    case unanswer = "대기중인 문의사항만"
}

struct AnswerFilterPopup: View {
    let answerList: [AnswerList]
    var selectedAnswer: AnswerList?
    let onAnswerSelect: (AnswerList) -> Void
    let cancel: (Bool) -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .frame(height: 206)
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

                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 8) {
                            ForEach(answerList, id: \.self) { answer in
                                answerListRow(
                                    answer: answer,
                                    selectedAnswer: selectedAnswer,
                                    onAnswerSelect: onAnswerSelect
                                )
                            }
                        }
                        .padding(.top, 24)

                        Spacer()
                    }
                }
                .padding(.horizontal, 24)
            }
    }

    @ViewBuilder
    func answerListRow(
        answer: AnswerList,
        selectedAnswer: AnswerList?,
        onAnswerSelect: @escaping (AnswerList) -> Void
    ) -> some View {
        HStack(spacing: 8) {
            BitgouelRadioButton(
                isSelected: Binding(
                    get: { selectedAnswer?.rawValue == answer.rawValue },
                    set: { isSelected in
                        if isSelected {
                            onAnswerSelect(answer)
                        }
                    }
                )
            )

            BitgouelText(
                text: answer.rawValue,
                font: .text3
            )

            Spacer()
        }
        .onTapGesture {
            onAnswerSelect(answer)
        }
        .id(answer)
        .frame(height: 54)
    }
}
