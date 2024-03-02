import SwiftUI

struct NoticeListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NoticeListViewModel

    private let inquiryListFactory: any InquiryListFactory
    private let noticeDetailFactory: any NoticeDetailFactory
    private let inputNoticeFactory: any InputNoticeFactory

    init(
        viewModel: NoticeListViewModel,
        inquiryListFactory: any InquiryListFactory,
        noticeDetailFactory: any NoticeDetailFactory,
        inputNoticeFactory: any InputNoticeFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inquiryListFactory = inquiryListFactory
        self.noticeDetailFactory = noticeDetailFactory
        self.inputNoticeFactory = inputNoticeFactory
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                if let noticeInfo = viewModel.noticeContent {
                    LazyVStack(spacing: 0) {
                        ForEach(noticeInfo.content, id: \.postID) { notice in
                            ListRow(
                                id: notice.postID,
                                title: notice.title,
                                modifiedAt: notice.modifiedAt.toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss.SSS")
                            )
                            .onTapGesture {
                                viewModel.noticeID = notice.postID
                                viewModel.updateIsPresentedNoticeDetailView(isPresented: true)
                            }

                            Divider()
                        }
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 28)
            .onAppear {
                viewModel.onAppear()
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("공지사항")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        BitgouelAsset.Icons.message.swiftUIImage
                    }

                    Button {
                        viewModel.updateIsPresentedInquiryListView(isPresented: true)
                    } label: {
                        BitgouelAsset.Icons.questionmark.swiftUIImage
                    }

                    Button {
                        viewModel.updateIsPresentedInputNoticeView(isPresented: true)
                    } label: {
                        BitgouelAsset.Icons.add.swiftUIImage
                    }
                }
            }
            .navigate(
                to: inquiryListFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedInquiryListView },
                    set: { isPresented in
                        viewModel.updateIsPresentedInquiryListView(isPresented: isPresented)
                    }
                )
            )
            .navigate(
                to: noticeDetailFactory.makeView(noticeID: viewModel.noticeID).eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedNoticeDetailView },
                    set: { isPresented in
                        viewModel.updateIsPresentedNoticeDetailView(isPresented: isPresented)
                    }
                )
            )
            .navigate(
                to: inputNoticeFactory.makeView(state: "추가", noticeID: "").eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedInputNoticeView },
                    set: { isPresented in
                        viewModel.updateIsPresentedInputNoticeView(isPresented: isPresented)
                    }
                )
            )
        }
        .refreshable {
            viewModel.onAppear()
        }
    }
}
