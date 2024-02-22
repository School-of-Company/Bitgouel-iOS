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
                    description: "국가는 국민 모두의 생산 및 생활의 기반이 되는 국토의 효율적이고 균형있는 이용·개발과 보전을 위하여 법률이 정하는 바에 의하여 그에 관한 필요한 제한과 의무를 과할 수 있다.",
                    isShowing: $viewModel.isEnrolment,
                    alertActions: [
                        .init(text: "취소", style: .cancel) {
                            viewModel.isEnrolment = false
                        },
                        .init(text: "신청", style: .default) {
                            viewModel.isSuccessEnrolment = true
                            viewModel.isEnrolment = false
                        }
                    ]
                )
            }
        }
    }
}
