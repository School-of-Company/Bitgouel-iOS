import SwiftUI

struct LectureOpenApplyView: View {
    @StateObject var viewModel: LectureOpenApplyViewModel
    
    private let lectureOpenApplyFactory: any LectureOpenApplyFactory
    
    init(
        viewModel: LectureOpenApplyViewModel,
        lectureOpenApplyFactory: any LectureOpenApplyFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.lectureOpenApplyFactory = lectureOpenApplyFactory
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
                    
                },
                title: Binding(
                    get: { viewModel.lectureTitle },
                    set: { title in viewModel.lectureTitle = title }
                ),
                text: Binding(
                    get: { viewModel.lectureText },
                    set: { text in viewModel.lectureText = text }
                )
            )
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { viewModel.isPresentedLectureDetailSettingAppend },
                set: { _ in viewModel.updateIsPresentedLectureDetailSettingAppend(state: false) }
            )
        ) {
//            DeferView {
//                lectureOpenApplyFactory.makeView(
//                )
        }
    }
}
