import SwiftUI

struct InputInquiryView: View {
    @StateObject var viewModel: InputInquiryViewModel
    @Environment(\.dismiss) var dismiss

    init(viewModel: InputInquiryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            TextEditor(text: Binding(
                get: { viewModel.question },
                set: { question in
                    guard question.count <= 100 else { return }
                    viewModel.updateQuestion(question: question)
                }
            ))
            .bitgouelFont(.title3)
            .overlay(alignment: .topLeading) {
                if viewModel.question.isEmpty {
                    BitgouelText(
                        text: "문의 제목 (100자 이내)",
                        font: .title3
                    )
                    .padding(.top, 8)
                    .padding(.leading, 4)
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                }
            }
            .frame(minHeight: 40, maxHeight: 120)

            Divider()

            TextEditor(text: Binding(
                get: { viewModel.questionDetail },
                set: { content in
                    guard content.count <= 1000 else { return }
                    viewModel.updateQuestionDetail(content: content)
                }
            ))
            .bitgouelFont(.text3)
            .overlay(alignment: .topLeading) {
                if viewModel.questionDetail.isEmpty {
                    BitgouelText(
                        text: "본문 입력 (1000자 이내)",
                        font: .text3
                    )
                    .padding(.top, 8)
                    .padding(.leading, 4)
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                }
            }
            .padding(.top, 16)
            
            Divider()
                .padding(.bottom, 24)

            BitgouelButton(
                text: "문의사항 \(viewModel.state)"
            ) {
                viewModel.updateIsShowingAlert(isShowing: true)
            }
        }
        .padding(.horizontal, 24)
        .onAppear {
            if viewModel.state == "수정" {
                viewModel.onAppear()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .bitgouelAlert(
            title: "문의사항을 \(viewModel.state)하시겠습니까?",
            description: viewModel.question,
            isShowing: Binding(
                get: { viewModel.isShowingAlert },
                set: { isShowing in
                    viewModel.updateIsShowingAlert(isShowing: isShowing)
                }
            ),
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.updateIsShowingAlert(isShowing: false)
                },
                .init(text: viewModel.state, style: .default) {
                    viewModel.applyButtonDidTap {
                        dismiss()
                    }
                }
            ]
        )
    }
}
