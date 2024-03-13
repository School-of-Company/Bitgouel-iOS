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
            VStack(alignment: .leading) {
                HStack {
                    Text("상태")
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("날짜")
                        
                        Text("에 수정됨")
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                }
                .font(.bitgouel(.caption))
                
                BitgouelText(
                    text: "문의사항 제목",
                    font: .text1
                )
                .padding(.top, 4)
                
                HStack {
                    BitgouelText(
                        text: "날짜",
                        font: .text3
                    )
                    BitgouelText(
                        text: "작성됨",
                        font: .text3
                    )
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        BitgouelText(text: "게시자", font: .text3)
                        
                        BitgouelText(
                            text: "김김김",
                            font: .text3
                        )
                        .padding(.leading, 4)
                    }
                }
                .foregroundColor(.bitgouel(.greyscale(.g4)))
                .padding(.top, 4)
            }
            
            ScrollView {
                Text("문의사항 본문")
            }
            .padding(.top, 24)
            
            if viewModel.authority == .admin {
                popupButtonByAdmin()
            } else {
                popupButtonByWriter()
            }
        }
        .padding(.horizontal, 28)
        .onAppear {
            tabbarHidden.wrappedValue = true
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
