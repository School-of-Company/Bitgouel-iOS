import SwiftUI

struct InquiryDetailView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: InquiryDetailViewModel
    
    init(viewModel: InquiryDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
            tabbarHidden.wrappedValue = false
        }
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
