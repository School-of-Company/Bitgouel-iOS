import SwiftUI

struct WriteInquiryAnswerView: View {
    @StateObject var viewModel: WriteInquiryAnswerViewModel

    init(viewModel: WriteInquiryAnswerViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TextEditor(text: Binding(
                    get: { viewModel.answer },
                    set: { newValue in
                        guard newValue.count <= 500 else { return }
                        viewModel.answer = newValue
                    }
                ))
                .bitgouelFont(.text3)
                .overlay(alignment: .topLeading) {
                    if viewModel.answer.isEmpty {
                        BitgouelText(
                            text: "답변 내용 작성(최대 500자)",
                            font: .text3
                        )
                        .padding(.top, 8)
                        .padding(.leading, 4)
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                    }
                }
                .frame(height: 576)

                Spacer()

                CTAButton(
                    text: "답변하기",
                    style: .default
                ) {
                    #warning("문의 사항 답변하기 ButtonAction")
                }
            }
        }
        .padding(.horizontal, 28)
    }
}
