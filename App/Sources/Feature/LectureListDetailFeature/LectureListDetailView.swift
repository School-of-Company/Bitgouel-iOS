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
                BitgouelButton(
                    text: viewModel.enrolmentButtonText,
                    style: viewModel.isSuccessEnrolment ? .secondary : .primary
                ) {
                    viewModel.enrollmentButtonDidTap()
                }
                .disabled(viewModel.isEnabledEnrolment)
                .cornerRadius(8)
                .padding(.horizontal, 28)
                .bitgouelAlert(
                    title: "수강 신청하시겠습니까?",
                    description: viewModel.lectureDetail?.name ?? "",
                    isShowing: $viewModel.isEnrolment,
                    alertActions: [
                        .init(text: "취소", style: .cancel) {
                            viewModel.isEnrolment = false
                        },
                        .init(text: "신청", style: .default) {
                            viewModel.applyLecture()
                        }
                    ]
                )
            }
        }
    }
}
