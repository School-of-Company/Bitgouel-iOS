import SwiftUI

struct OpenLectureApplyView: View {
    @StateObject var viewModel: OpenLectureApplyViewModel
    
    private let openLectureApplyFactory: any OpenLectureApplyFactory
    private let lectureDetailSettingFactory: any LectureDetailSettingFactory
    
    init(
        viewModel: OpenLectureApplyViewModel,
        openLectureApplyFactory: any OpenLectureApplyFactory,
        lectureDetailSettingFactory: any LectureDetailSettingFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.openLectureApplyFactory = openLectureApplyFactory
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
            DeferView {
                openLectureApplyFactory.makeView().eraseToAnyView()
            }
        }
    }
}
