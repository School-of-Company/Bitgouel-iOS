import SwiftUI

struct PostListView: View {
    @StateObject var viewModel: PostListViewModel
    
    private let noticeListFactory: any NoticeListFactory
    private let inquiryListFactory: any InquiryListFactory
    private let inputPostFactory: any InputPostFactory
    
    init(
        viewModel: PostListViewModel,
        noticeListFactory: any NoticeListFactory,
        inquiryListFactory: any InquiryListFactory,
        inputPostFactory: any InputPostFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.noticeListFactory = noticeListFactory
        self.inquiryListFactory = inquiryListFactory
        self.inputPostFactory = inputPostFactory
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.postList, id: \.postId) { item in
                            ListRow(
                                id: item.postId,
                                title: item.title,
                                modifedAt: item.modifedAt,
                                isPresented: Binding(get: {
                                    viewModel.isPresentedAleterBottomSheet
                                }, set: { isPresented in
                                    viewModel.isPresentedAleterBottomSheet = isPresented
                                })
                            )
                            
                            Divider()
                        }
                    }
                    
                    Spacer()
                }
            }
            .onAppear {
                viewModel.onAppear()
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
                to: inputPostFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedInputPostView},
                    set: { _ in viewModel.isPresentedInputPostView = false }
                )
            )
            .padding(.horizontal, 28)
            .alterBottomSheet(isShowing: $viewModel.isPresentedAleterBottomSheet)
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
    }
}
