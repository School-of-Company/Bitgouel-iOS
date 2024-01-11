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
                    Text(viewModel.activityDetail?.approveStatus.rawValue ?? "")

                    Spacer()

                    Text(viewModel.activityDetail?.activityDate ?? "")
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                }

                BitgouelText(
                    text: viewModel.activityDetail?.title ?? "",
                    font: .text1
                )

                HStack {
                    BitgouelText(
                        text: viewModel.activityDetail?.activityDate ?? "",
                        font: .text3
                    )

                    Spacer()

                    BitgouelText(
                        text: String(viewModel.activityDetail?.credit ?? 0),
                        font: .text3
                    )
                }
                .foregroundColor(.bitgouel(.greyscale(.g4)))
            }

            ScrollView {
                Text(viewModel.activityDetail?.content ?? "")
            }
            .padding(.top, 24)

                popupButtonByWriter()
        }
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func popupButtonByTeacher() -> some View {
        ZStack {
            HStack {
                CTAButton(
                    text: "활동 거부",
                    style: .error,
                    action: {
                        viewModel.rejectActivity()
                    }
                )

                Spacer()

                CTAButton(
                    text: "활동 승인",
                    style: .default,
                    action: {
                        viewModel.approveActivity()
                    }
                )
            }
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
                    viewModel.deleteActivity()
                }
            )
        }
    }
}
