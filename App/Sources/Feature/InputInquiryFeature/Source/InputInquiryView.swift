import SwiftUI

struct InputInquiryView: View {
    @StateObject var viewModel: InputInquiryViewModel
    @Environment(\.tabbarHidden) var tabbarHidden
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: InputInquiryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                TextEditor(text: Binding(
                    get: { viewModel.question },
                    set: { newValue in
                        guard newValue.count <= 100 else { return }
                        viewModel.question = newValue
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
            }
            .frame(minHeight: 40, maxHeight: 120)
            
            Divider()
            
            ScrollView {
                TextEditor(text: Binding(
                    get: { viewModel.questionDetail },
                    set: { newValue in
                        guard newValue.count <= 1000 else { return }
                        viewModel.questionDetail = newValue
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
            }
            .padding(.top, 16)
            .frame(height: 460)
            
            Divider()
                .padding(.bottom, 24)
            
            CTAButton(
                text: "문의사항 \(viewModel.state)",
                style: .default
            ) {
                viewModel.updateIsShowingAlert(isShowing: true)
            }
        }
        .onAppear {
            tabbarHidden.wrappedValue = true
            if viewModel.state == "수정" {
                viewModel.onAppear()
            }
        }
        .onDisappear {
            if viewModel.state == "추가" {
                tabbarHidden.wrappedValue = false
            }
        }
        .padding(.horizontal, 24)
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
                    viewModel.applyButtonDidTap()
                    dismiss()
                }
            ]
        )
    }
}
