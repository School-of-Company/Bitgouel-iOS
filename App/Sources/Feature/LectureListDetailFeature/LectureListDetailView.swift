import SwiftUI

struct LectureListDetailView: View {
    @StateObject var viewModel: LectureListDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: LectureListDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 4) {
                    HStack {
                        Text("# \(viewModel.lectureDetail?.lectureType.display() ?? "")")
                            .bitgouelFont(.caption, color: .primary(.p3))

                        Spacer()
                    }

                    Text("\(viewModel.lectureDetail?.name ?? "")")
                    .bitgouelFont(.text1, color: .greyscale(.g0))
                    .lineSpacing(5)

                    HStack {
                        Text("\(viewModel.lectureDetail?.startDate ?? "") ~ \(viewModel.lectureDetail?.endDate ?? "")")

                        Spacer()

                        Text("\(viewModel.lectureDetail?.headCount ?? 0)/\(viewModel.lectureDetail?.maxRegisteredUser ?? 0)명")
                    }
                    .bitgouelFont(.text3, color: .primary(.p5))

                    HStack(spacing: 4) {
                        Text(viewModel.lectureDetail?.completedDate ?? "")

                        Text("부터 시작")

                        Spacer()

                        Text("학점")

                        Text("\(viewModel.lectureDetail?.credit ?? 0)점")

                        Text("부여")
                    }
                    .bitgouelFont(.caption, color: .greyscale(.g4))

                    HStack(spacing: 4) {
                        Text(viewModel.lectureDetail?.createAt ?? "")

                        Text("에 게시")

                        Spacer()

                        Text(viewModel.lectureDetail?.lecturer ?? "")

                        Text("교수님")
                    }
                    .bitgouelFont(.caption, color: .greyscale(.g7))

                    Text(viewModel.lectureDetail?.content ?? "")
                    .bitgouelFont(.text3)
                    .lineSpacing(10)
                    .padding(.top, 20)
                }
                .padding(.top, 24)
                .padding(.horizontal, 28)
            }
            .onAppear {
                viewModel.onAppear()
            }
            .overlay(alignment: .bottom) {
                if viewModel.lectureDetail?.isRegistered ?? true {
                    applyPopupButton()
                } else {
                    cancelPopupButton()
                }
            }
            .bitgouelAlert(
                title: "수강 신청하시겠습니까?",
                description: viewModel.lectureDetail?.name ?? "",
                isShowing: $viewModel.isApply,
                alertActions: [
                    .init(text: "취소", style: .cancel) {
                        viewModel.isApply = false
                    },
                    .init(text: "신청", style: .default) {
                        viewModel.applyLecture()
                    }
                ]
            )
            .bitgouelAlert(
                title: "수강 취소하시겠습니까?",
                description: viewModel.lectureDetail?.name ?? "",
                isShowing: $viewModel.isCancel,
                alertActions: [
                    .init(text: "취소", style: .cancel) {
                        viewModel.isCancel = false
                    },
                    .init(text: "확인", style: .error) {
                        viewModel.cancelLecture()
                    }
                ]
            )
        }
    }
    
    @ViewBuilder
    func applyPopupButton() -> some View {
        BitgouelButton(
            text: "수강 신청하기",
            style: .primary
        ) {
            viewModel.isApply = true
        }
        .cornerRadius(8)
        .padding(.horizontal, 28)
    }
    
    @ViewBuilder
    func cancelPopupButton() -> some View {
        BitgouelButton(
            text: "수강 신청 취소",
            style: .cancel
        ) {
            viewModel.isCancel = true
        }
        .cornerRadius(8)
        .padding(.horizontal, 28)
    }
}
