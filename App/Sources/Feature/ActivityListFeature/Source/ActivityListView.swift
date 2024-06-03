import Service
import SwiftUI

struct ActivityListView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: ActivityListViewModel

    private let inputActivityFactory: any InputActivityFactory
    private let activityDetailFactory: any ActivityDetailFactory

    init(
        viewModel: ActivityListViewModel,
        inputActivityFactory: any InputActivityFactory,
        activityDetailFactory: any ActivityDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputActivityFactory = inputActivityFactory
        self.activityDetailFactory = activityDetailFactory
    }

    var body: some View {
        VStack {
            if !viewModel.isLoading {
                if let activityList = viewModel.activityList {
                    if activityList.content.isEmpty {
                        NoInfoView(text: "활동이 없어요")
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(activityList.content, id: \.activityID) { item in
                                    ActivityListRow(
                                        id: item.activityID,
                                        title: item.title,
                                        date: item.activityDate,
                                        userID: item.userID,
                                        name: item.userName,
                                        authority: viewModel.authority
                                    )
                                    .buttonWrapper {
                                        withAnimation {
                                            viewModel.updateActivityID(activityID: item.activityID)
                                            viewModel.updateIsPresentedActivityDetailView(isPresented: true)
                                        }
                                    }
                                }
                            }
                            .padding(.top, 8)
                        }
                    }
                }
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
        .bitgouelBackButton(dismiss: dismiss)
        .padding(.horizontal, 28)
        .navigationTitle("학생활동").navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if viewModel.authority == .student {
                    Button {
                        viewModel.updateIsPresentedInputActivityView(isPresented: true)
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
            to: activityDetailFactory.makeView(activityID: viewModel.activityID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedActivityDetailView },
                set: { isPresented in
                    viewModel.updateIsPresentedActivityDetailView(isPresented: isPresented)
                }
            )
        )
        .onChange(of: viewModel.isPresentedActivityDetailView) { newValue in
            tabbarHidden.wrappedValue = newValue
        }
        .navigate(
            to: inputActivityFactory.makeView(state: "추가", activityID: "").eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputActivityView },
                set: { isPresented in
                    viewModel.updateIsPresentedInputActivityView(isPresented: isPresented)
                }
            )
        )
        .onChange(of: viewModel.isPresentedInputActivityView) { newValue in
            tabbarHidden.wrappedValue = newValue
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
