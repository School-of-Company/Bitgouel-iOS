import SwiftUI

struct WriteInquiryAnswerView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: WriteInquiryAnswerViewModel

    init(viewModel: WriteInquiryAnswerViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
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
                    .padding(.top, 12)
                    .padding(.leading, 8)
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                }
            }
            .frame(height: 576)

            Spacer()

            BitgouelButton(
                text: "답변하기",
                style: .primary
            ) {
                viewModel.applyButtonDidTap {
                    dismiss()
                }
            }
        }
        .padding(.horizontal, 28)
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}
