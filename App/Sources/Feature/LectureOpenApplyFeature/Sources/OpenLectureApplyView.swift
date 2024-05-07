import SwiftUI

struct OpenLectureApplyView: View {
    @StateObject var viewModel: OpenLectureApplyViewModel

    private let lectureDetailSettingFactory: any LectureDetailSettingFactory

    init(
        viewModel: OpenLectureApplyViewModel,
        lectureDetailSettingFactory: any LectureDetailSettingFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.lectureDetailSettingFactory = lectureDetailSettingFactory
    }

    var body: some View {
        VStack(spacing: 0) {
            InputFormView(
                epic: "강의",
                state: "개설 신청",
                settingButtonAction: {
                    viewModel.updateIsPresentedLectureDetailSettingAppend(state: true)
                },
                finalButtonAction: {
                    viewModel.openLectureButtonDidTap()
                },
                title: Binding(
                    get: { viewModel.lectureTitle },
                    set: { title in viewModel.updateLectureTitle(title: title) }
                ),
                text: Binding(
                    get: { viewModel.lectureText },
                    set: { text in viewModel.updateLectureText(text: text) }
                )
            )
        }
        .onTapGesture {
            hideKeyboard()
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: Binding(
                get: { viewModel.isErrorOccurred },
                set: { state in viewModel.updateIsErrorOccurred(state: state) }
            )
        )
        .fullScreenCover(
            isPresented: Binding(
                get: { viewModel.isPresentedLectureDetailSettingAppend },
                set: { state in viewModel.updateIsPresentedLectureDetailSettingAppend(state: state) }
            )
        ) {
            DeferView {
                lectureDetailSettingFactory.makeView(detailInfo: viewModel.openLectureInfo) { detailInfo in
                    viewModel.updateOpenLectureInfo(detailInfo: detailInfo)
                }
                .eraseToAnyView()
            }
        }
    }
}
