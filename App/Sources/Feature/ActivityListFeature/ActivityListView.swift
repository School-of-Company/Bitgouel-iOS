import Service
import SwiftUI

struct ActivityListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var model: ActivityListModel
    @StateObject var viewModel: ActivityListViewModel

    private let inputActivityFactory: any InputActivityFactory
    private let activityDetailFactory: any ActivityDetailFactory

    init(
        model: ActivityListModel,
        viewModel: ActivityListViewModel,
        inputActivityFactory: any InputActivityFactory,
        activityDetailFactory: any ActivityDetailFactory
    ) {
        _model = StateObject(wrappedValue: model)
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputActivityFactory = inputActivityFactory
        self.activityDetailFactory = activityDetailFactory
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVStack(spacing: 12) {
                        ForEach(model.activityList, id: \.activityId) { item in
                            RoundListRow(
                                id: item.activityId,
                                title: item.title,
                                date: item.activityDate,
                                userId: item.userId,
                                name: item.userName,
                                state: item.approveStatus,
                                authority: model.authority
                            )
                            .buttonWrapper {
                                withAnimation {
                                    viewModel.activityDidSelect(activityId: item.activityId)
                                    model.isPresentedActivityDetailPage = true
                                }
                            }
                        }
                    }
                    .padding(.top, 8)
                }
            }
            .bitgouelToast(
                text: model.errorMessage,
                isShowing: Binding(
                    get: { viewModel.isErrorOccurred },
                    set: { _ in viewModel.toastDismissed() }
                )
            )
            .bitgouelBackButton(dismiss: dismiss)
            .padding(.horizontal, 28)
            .navigationTitle("학생활동").navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if model.authority == .student {
                        Button {
                            viewModel.inputActivityViewIsRequired()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.bitgouel(.greyscale(.g8)))
                        }
                    }
                }
            }
            .navigate(
                to: activityDetailFactory.makeView(activityId: model.selectedActivityId ?? "").eraseToAnyView(),
                when: Binding(
                    get: { model.isPresentedActivityDetailPage },
                    set: { _ in viewModel.activityDetailPageDismissed() }
                )
            )
            .navigate(
                to: inputActivityFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedInputActivityView },
                    set: { _ in viewModel.inputActivityViewIsDismissed() }
                )
            )
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
