import SwiftUI

struct InquiryDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: InquiryDetailViewModel
    
    private let inputInquiryFactory: any InputInquiryFactory
    private let writeInquiryAnswerFactory: any WriteInquiryAnswerFactory
    
    init(
        viewModel: InquiryDetailViewModel,
        inputInquiryFactory: any InputInquiryFactory,
        writeInquiryAnswerFactory: any WriteInquiryAnswerFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputInquiryFactory = inputInquiryFactory
        self.writeInquiryAnswerFactory = writeInquiryAnswerFactory
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let inquiryInfo = viewModel.inquiryDetail {
                VStack(alignment: .leading) {
                    HStack {
                        Text(inquiryInfo.answerStatus.display())
                            .foregroundColor(viewModel.statusColor)
                        
                        Spacer()
                        
                        HStack(spacing: 0) {
                            Text(inquiryInfo.answeredDate?.toStringCustomFormat(format: "yyyy.M.dd") ?? "")
                            
                            Text("에 답변됨")
                        }
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                    }
                    .font(.bitgouel(.caption))
                    
                    BitgouelText(
                        text: inquiryInfo.question,
                        font: .text1
                    )
                    .padding(.top, 4)
                    
                    HStack {
                        BitgouelText(
                            text: inquiryInfo.questionDate.toStringCustomFormat(format: "yyyy.M.dd"),
                            font: .text3
                        )
                        BitgouelText(
                            text: "작성",
                            font: .text3
                        )
                        
                        Spacer()
                        
                        HStack(spacing: 0) {
                            BitgouelText(text: "게시자", font: .text3)
                            
                            BitgouelText(
                                text: inquiryInfo.questioner,
                                font: .text3
                            )
                            .padding(.leading, 4)
                        }
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g4)))
                    .padding(.top, 4)
                }
                
                ScrollView {
                    Text(inquiryInfo.questionDetail)
                }
                .padding(.top, 24)
                
                if viewModel.authority == .admin {
                    popupButtonByAdmin()
                } else {
                    popupButtonByWriter()
                }
            }
        }
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
        .navigate(
            to: inputInquiryFactory.makeView(state: "수정", inquiryID: viewModel.inquiryID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputInquiryView },
                set: { isPresented in
                    viewModel.updateIsPresentedInputInquiryView(isPresented: isPresented)
                }
            )
        )
        .navigate(
            to: writeInquiryAnswerFactory.makeView(inquiryID: viewModel.inquiryID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedWriteInquiryAnswerView },
                set: { isPresented in
                    viewModel.updateIsPresentedWriteInquiryAnswerView(isPresented: isPresented)
                }
            )
        )
        .bitgouelAlert(
            title: "문의사항을 삭제하시겠습니까?",
            description: viewModel.inquiryDetail?.question ?? "",
            isShowing: Binding(
                get: { viewModel.isDeleteInquiry },
                set: { isDelete in
                    viewModel.updateIsDeleteInquiry(isDelete: isDelete)
                }
            ),
            alertActions: [
                .init(
                    text: "취소",
                    style: .cancel,
                    action: {
                        viewModel.updateIsDeleteInquiry(isDelete: false)
                    })
                ,
                
                .init(
                    text: "삭제",
                    style: .error,
                    action: {
                        viewModel.deleteAction()
                        dismiss()
                    }
                )
            ]
        )
        .bitgouelAlert(
            title: "답변을 추가하시겠습니까?",
            description: viewModel.inquiryDetail?.question ?? "",
            isShowing: Binding(
                get: { viewModel.isWriteInquiryAnswer },
                set: { isWrite in
                    viewModel.updateIsWriteInquiryAnswer(isWrite: isWrite)
                }
            ),
            alertActions: [
                .init(
                    text: "취소",
                    style: .cancel,
                    action: {
                        viewModel.updateIsWriteInquiryAnswer(isWrite: false)
                    }
                ),
                .init(
                    text: "추가",
                    style: .default,
                    action: {
                        viewModel.updateIsPresentedWriteInquiryAnswerView(isPresented: true)
                    }
                )
            ]
        )
    }
    
    @ViewBuilder
    func popupButtonByAdmin() -> some View {
        HStack {
            CTAButton(
                text: "문의 삭제",
                style: .error,
                action: {
                    viewModel.updateIsDeleteInquiry(isDelete: true)
                }
            )
            
            Spacer()
            
            CTAButton(
                text: "문의 답변",
                style: .default,
                action: {
                    viewModel.updateIsWriteInquiryAnswer(isWrite: true)
                }
            )
        }
    }
    
    @ViewBuilder
    func popupButtonByWriter() -> some View {
        HStack {
            CTAButton(
                text: "문의 수정",
                style: .default,
                action: {
                    viewModel.updateIsPresentedInputInquiryView(isPresented: true)
                }
            )
            
            Spacer()
            
            CTAButton(
                text: "문의 삭제",
                style: .error,
                action: {
                    viewModel.updateIsDeleteInquiry(isDelete: true)
                }
            )
        }
    }
}
