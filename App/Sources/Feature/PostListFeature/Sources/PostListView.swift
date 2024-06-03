import SwiftUI

struct PostListView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: PostListViewModel
    @Binding var selection: TabFlow

    private let noticeListFactory: any NoticeListFactory
    private let inquiryListFactory: any InquiryListFactory
    private let inputPostFactory: any InputPostFactory
    private let postDetailFactory: any PostDetailFactory

    init(
        viewModel: PostListViewModel,
        noticeListFactory: any NoticeListFactory,
        inquiryListFactory: any InquiryListFactory,
        inputPostFactory: any InputPostFactory,
        postDetailFactory: any PostDetailFactory,
        selection: Binding<TabFlow>
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.noticeListFactory = noticeListFactory
        self.inquiryListFactory = inquiryListFactory
        self.inputPostFactory = inputPostFactory
        self.postDetailFactory = postDetailFactory
        _selection = selection
    }

    var body: some View {
        NavigationView {
            VStack {
                if let postInfo = viewModel.postContent {
                    if postInfo.content.isEmpty {
                        NoInfoView(text: "게시글이 없어요")
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 0) {
                                ForEach(postInfo.content, id: \.postID) { item in
                                    ListRow(
                                        id: item.postID,
                                        title: item.title,
                                        modifiedAt: item.modifiedAt
                                            .toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss.SSS")
                                    )
                                    .onTapGesture {
                                        viewModel.seletePost(postID: item.postID)
                                        viewModel.isPresentedPostDetailView = true
                                    }

                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .refreshable {
                viewModel.onAppear()
            }
            .navigate(
                to: postDetailFactory.makeView(postID: viewModel.seletedPostID).eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedPostDetailView },
                    set: { _ in viewModel.isPresentedPostDetailView = false }
                )
            )
            .onChange(of: viewModel.isPresentedPostDetailView) { newValue in
                tabbarHidden.wrappedValue = newValue
            }
            .navigate(
                to: noticeListFactory.makeview().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedNoticeListView },
                    set: { _ in viewModel.isPresentedNoticeListView = false }
                )
            )
            .navigate(
                to: inquiryListFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedInquiryView },
                    set: { _ in viewModel.isPresentedInquiryView = false }
                )
            )
            .navigate(
                to: inputPostFactory.makeView(state: "등록", postID: "").eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedInputPostView },
                    set: { _ in viewModel.isPresentedInputPostView = false }
                )
            )
            .onChange(of: viewModel.isPresentedInputPostView) { newValue in
                tabbarHidden.wrappedValue = newValue
            }
            .padding(.horizontal, 28)
            .navigationTitle("게시글 목록")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.isPresentedNoticeListView = true
                    } label: {
                        BitgouelAsset.Icons.megaphone.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }

                    Button {
                        viewModel.isPresentedInquiryView = true
                    } label: {
                        BitgouelAsset.Icons.questionmark.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }

                    if viewModel.authority != .student && viewModel.authority != .teacher {
                        Button {
                            viewModel.isPresentedInputPostView = true
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
            .loginAlert(
                isShowing: Binding(
                    get: { viewModel.isShowingLoginAlert },
                    set: { isShowing in
                        viewModel.updateIsShowingLoginAlert(isShowing: isShowing)
                    }
                )
            ) {
                $selection.wrappedValue = .home
            }
            .bitgouelToast(
                text: viewModel.errorMessage,
                isShowing: $viewModel.isErrorOccurred
            )
        }
    }
}
