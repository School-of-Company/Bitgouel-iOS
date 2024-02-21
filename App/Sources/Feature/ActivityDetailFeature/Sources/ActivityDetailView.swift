import Service
import SwiftUI

struct ActivityDetailView: View {
    @StateObject var viewModel: ActivityDetailViewModel
    
    init(viewModel: ActivityDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.activityDetail?.approveStatus.display() ?? "")
                        .foregroundColor(viewModel.statusColor)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text(viewModel.activityDetail?.modifiedAt ?? "")
                        
                        Text("에 수정됨")
                    }
                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                }
                .font(.bitgouel(.caption))
                
                BitgouelText(
                    text: viewModel.activityDetail?.title ?? "",
                    font: .text1
                )
                .padding(.top, 4)
                
                HStack {
                    BitgouelText(
                        text: viewModel.activityDetail?.activityDate ?? "",
                        font: .text3
                    )
                    BitgouelText(
                        text: "활동",
                        font: .text3
                    )
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        BitgouelText(text: "학점", font: .text3)
                        
                        BitgouelText(
                            text: "\(viewModel.activityDetail?.credit ?? 0)",
                            font: .text3
                        )
                        .padding(.leading, 4)
                        
                        BitgouelText(text: "점 부여", font: .text3)
                    }
                }
                .foregroundColor(.bitgouel(.greyscale(.g4)))
                .padding(.top, 4)
            }
            
            ScrollView {
                Text(viewModel.activityDetail?.content ?? "")
            }
            .padding(.top, 24)
            
            if viewModel.authority == .admin {
                popupButtonByTeacher()
            } else if viewModel.authority == .student || viewModel.authority == .teacher {
                popupButtonByWriter()
            }
        }
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
        .bitgouelAlert(
            title: "활동 승인하시겠습니까?",
            description: viewModel.activityDetail?.content ?? "",
            isShowing: $viewModel.isApprove,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isApprove = false
                },
                .init(text: "승인", style: .default) {
                    viewModel.approveActivity()
                }
            ]
        )
        .bitgouelAlert(
            title: "활동 거부하시겠습니까?",
            description: viewModel.activityDetail?.content ?? "",
            isShowing: $viewModel.isReject,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isReject = false
                },
                .init(text: "거부", style: .error) {
                    viewModel.rejectActivity()
                }
            ]
        )
        .bitgouelAlert(
            title: "활동 삭제하시겠습니까?",
            description: viewModel.activityDetail?.content ?? "",
            isShowing: $viewModel.isDelete,
            alertActions: [
                .init(text: "취소", style: .cancel) {
                    viewModel.isDelete = false
                },
                .init(text: "삭제", style: .error) {
                    viewModel.deleteActivity()
                }
            ]
        )
    }
    
    @ViewBuilder
    func popupButtonByTeacher() -> some View {
        HStack {
            CTAButton(
                text: "활동 거부",
                style: .error,
                action: {
                    viewModel.isReject = true
                }
            )
            
            Spacer()
            
            CTAButton(
                text: "활동 승인",
                style: .default,
                action: {
                    viewModel.isApprove = true
                }
            )
        }
    }
    
    @ViewBuilder
    func popupButtonByWriter() -> some View {
        HStack {
            CTAButton(
                text: "활동 수정",
                style: .default,
                action: {}
            )
            
            Spacer()
            
            CTAButton(
                text: "활동 삭제",
                style: .error,
                action: {
                    viewModel.isDelete = true
                }
            )
        }
    }
}
