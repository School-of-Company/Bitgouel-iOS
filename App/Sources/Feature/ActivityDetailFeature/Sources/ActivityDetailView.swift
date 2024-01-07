import SwiftUI

struct ActivityDetailView: View {
    @StateObject private var viewModel: ActivityDetailViewModel
    
    init(viewModel: ActivityDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text("상태")

                    Spacer()

                    Text("수정된 날짜")
                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                }

                BitgouelText(
                    text: "타이틀",
                    font: .text1
                )

                HStack {
                    BitgouelText(
                        text: "활동 날짜",
                        font: .text3
                    )

                    Spacer()

                    BitgouelText(
                        text: "부여 학점",
                        font: .text3
                    )
                }
                .foregroundColor(.bitgouel(.greyscale(.g4)))
            }

            ScrollView {
                Text("활동")
            }
            .padding(.top, 24)

            ZStack {
                popupButtonByWriter()
            }
        }
        .padding(.horizontal, 28)
    }

    @ViewBuilder
    func popupButtonByTeacher() -> some View {
        ZStack {
            HStack {
                CTAButton(
                    text: "활동 거부",
                    style: .error,
                    action: {}
                )

                Spacer()

                CTAButton(
                    text: "활동 승인",
                    style: .default,
                    action: {}
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
                action: {}
            )
        }
    }
}
