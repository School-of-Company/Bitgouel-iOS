import Service
import SwiftUI

struct ActivityDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ActivityDetailViewModel
    
    private let inputActivityFactory: any InputActivityFactory
    init(
        viewModel: ActivityDetailViewModel,
        inputActivityFactory: any InputActivityFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputActivityFactory = inputActivityFactory
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 24) {
                if let activityDetail = viewModel.activityDetail {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            
                            HStack(spacing: 0) {
                                Text(activityDetail.modifiedAt.toStringCustomFormat(format: "yyyy년M월dd일HH:mm"))
                                
                                Text("에 수정됨")
                            }
                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                        }
                        .font(.bitgouel(.caption))
                        
                        BitgouelText(
                            text: activityDetail.title,
                            font: .text1
                        )
                        .padding(.top, 4)
                        
                        HStack {
                            BitgouelText(
                                text: activityDetail.activityDate.toStringCustomFormat(format: "yyyy.M.d"),
                                font: .text3
                            )
                            BitgouelText(
                                text: "활동",
                                font: .text3
                            )
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                BitgouelText(
                                    text: "\(activityDetail.credit)",
                                    font: .text3
                                )
                                .padding(.leading, 4)
                                
                                BitgouelText(text: "점 수여", font: .text3)
                            }
                        }
                        .foregroundColor(.bitgouel(.greyscale(.g4)))
                        .padding(.top, 4)
                    }
                    
                    Divider()
                    
                    ScrollView(showsIndicators: false) {
                        Text(activityDetail.content)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.top, 24)
                    
                    if viewModel.authority == .student {
                        popupButtonByWriter()
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .padding(.horizontal, 28)
        .navigate(
            to: inputActivityFactory.makeView(state: "수정", activityID: viewModel.activityID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputActivityView },
                set: { isPresented in
                    viewModel.updateIsPresentedInputActivityView(isPresented: isPresented)
                }
            )
        )
        .bitgouelAlert(
            title: "활동 삭제하시겠습니까?",
            description: viewModel.activityDetail?.content ?? "",
            isShowing: $viewModel.isDelete,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.updateIsDelete(state: false)
                },
                .init(text: "삭제", style: .error) {
                    viewModel.deleteActivity()
                    dismiss()
                }
            ]
        )
    }
    
    @ViewBuilder
    func popupButtonByWriter() -> some View {
        HStack {
            CTAButton(
                text: "활동 수정",
                style: .default,
                action: {
                    viewModel.updateIsPresentedInputActivityView(isPresented: true)
                }
            )
            
            Spacer()
            
            CTAButton(
                text: "활동 삭제",
                style: .error,
                action: {
                    viewModel.updateIsDelete(state: true)
                }
            )
        }
    }
}
