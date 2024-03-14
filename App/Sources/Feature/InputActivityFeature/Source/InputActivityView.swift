import SwiftUI

struct InputActivityView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: InputActivityViewModel

    private let activityDetailSettingFactory: any ActivityDetailSettingFactory

    init(
        viewModel: InputActivityViewModel,
        activityDetailSettingFactory: any ActivityDetailSettingFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.activityDetailSettingFactory = activityDetailSettingFactory
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                InputFormView(
                    epic: "활동",
                    state: viewModel.state,
                    settingButtonAction: {
                        viewModel.isPresentedDetailSettingAppend = true
                    },
                    finalButtonAction: {
                        viewModel.applyButtonDidTap()
                        dismiss()
                    },
                    title: $viewModel.activityTitle,
                    text: $viewModel.activityText
                )
            }
            .fullScreenCover(
                isPresented: Binding(
                    get: { viewModel.isPresentedDetailSettingAppend },
                    set: { _ in viewModel.detailSettingAppendDismissed() }
                )
            ) {
                DeferView {
                    activityDetailSettingFactory.makeView(
                        activityDate: viewModel.activityDate, 
                        activityCredit: viewModel.activityCredit
                    ) {
                        activityDate, activityCredit in
                        viewModel.updateActivityDetail(
                            date: activityDate,
                            credit: activityCredit
                        )
                    }.eraseToAnyView()
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            if viewModel.state == "수정" {
                viewModel.onAppear()
            }
        }
    }
}
