import SwiftUI

struct InputFAQView: View {
    @State var question: String = ""
    @State var answer: String = ""
    @Binding var addFAQButtonDidTap: Bool
    var inputFAQAction: (_ question: String, _ answer: String) -> Void
    
    var body: some View {
        VStack {
            if !addFAQButtonDidTap {
                HStack {
                    BitgouelAsset.Icons.add.swiftUIImage
                        .renderingMode(.template)
                        .frame(width: 10, height: 10)
                        .foregroundColor(.bitgouel(.primary(.p5)))
                    
                    BitgouelText(
                        text: "자주 묻는 질문 추가하기",
                        font: .text3
                    )
                    .padding(.leading, 8)
                    .foregroundColor(.bitgouel(.primary(.p5)))
                    
                    Spacer()
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        .opacity(0.3)
                )
                .buttonWrapper {
                    addFAQButtonDidTap = true
                }
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 4) {
                        Text("Q.")
                            .bitgouelFont(.text3, color: .primary(.p5))
                        
                        TextEditor(
                            text: Binding(
                                get: { question },
                                set: { newQuestion in
                                    question = newQuestion
                                }
                            )
                        )
                        .overlay {
                            if question.isEmpty {
                                HStack {
                                    Text("질문 작성하기")
                                        .bitgouelFont(.text3, color: .greyscale(.g7))
                                        .padding(.leading, 4)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    Divider()
                        .background(Color.bitgouel(.greyscale(.g0)))
                    
                    HStack(spacing: 4) {
                        Text("A.")
                            .bitgouelFont(.text3, color: .primary(.p5))
                        
                        TextEditor(
                            text: Binding(
                                get: { answer },
                                set: { newAnswer in
                                    answer = newAnswer
                                }
                            )
                        )
                        .overlay {
                            if answer.isEmpty {
                                HStack {
                                    Text("답변 작성하기")
                                        .bitgouelFont(.text3, color: .greyscale(.g7))
                                        .padding(.leading, 4)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    Divider()
                        .background(Color.bitgouel(.greyscale(.g0)))
                    
                    HStack(spacing: 24) {
                        Spacer()
                        
                        Button {
                            addFAQButtonDidTap = false
                            question = ""
                            answer = ""
                        } label: {
                            Text("취소")
                                .bitgouelFont(.text3, color: .greyscale(.g7))
                        }
                        
                        Button {
                            inputFAQAction(question, answer)
                        } label: {
                            Text("작성")
                                .bitgouelFont(.text3, color: .primary(.p5))
                        }
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                        .opacity(0.3)
                )
            }
        }
    }
}
