import SwiftUI

struct InquiryDetailView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: InquiryDetailViewModel
    
    private let inputInquiryFactory: any InputInquiryFactory
    
    init(
        viewModel: InquiryDetailViewModel,
        inputInquiryFactory: any InputInquiryFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputInquiryFactory = inputInquiryFactory
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
            tabbarHidden.wrappedValue = true
            viewModel.onAppear()
        }
        .onDisappear {
            if !viewModel.isPresentedInputInquiryView {
                tabbarHidden.wrappedValue = false
            }
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
    }
    
    @ViewBuilder
    func popupButtonByAdmin() -> some View {
        HStack {
            CTAButton(
                text: "문의 삭제",
                style: .error,
                action: {
                }
            )
            
            Spacer()
            
            CTAButton(
                text: "문의 답변",
                style: .default,
                action: {
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
                }
            )
        }
    }
}
