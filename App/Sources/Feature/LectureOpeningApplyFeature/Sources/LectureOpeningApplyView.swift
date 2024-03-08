import SwiftUI

struct LectureOpeningApplyView: View {
    @StateObject var viewModel: LectureOpeningApplyViewModel
        
    var body: some View {
        VStack(spacing: 0) {
            InputFormView(
                epic: "강의",
                state: "개설 신청",
                settingButtonAction: {
                    viewModel.isPresentedDetailSetting(state: true)
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
                set: { _ in viewModel.isPresentedDetailSetting(state: false) }
            )
        ) {
            LectureDetailSettingsView(viewModel: LectureOpeningApplyViewModel())
        }
    }
}
