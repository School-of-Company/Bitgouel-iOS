import SwiftUI

struct InquiryListView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: InquiryListViewModel

    private let inputInquiryFactory: any InputInquiryFactory
    private let inquiryDetailFactory: any InquiryDetailFactory

    init(
        viewModel: InquiryListViewModel,
        inputInquiryFactory: any InputInquiryFactory,
        inquiryDetailFactory: any InquiryDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inputInquiryFactory = inputInquiryFactory
        self.inquiryDetailFactory = inquiryDetailFactory
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: true) {
                if viewModel.authority == .admin {
                    KeywordSearchBar(
                        text: Binding(
                            get: { viewModel.keyword },
                            set: { text in viewModel.updateKeyword(text: text) }
                        ),
                        prompt: "키워드로 검색..."
                    ) {
                        viewModel.updateIsPresentedFilter(isPresented: true)
                    }
                }

                if viewModel.inquiryList.isEmpty {
                    NoInfoView(text: "문의사항이 없어요")
                        .padding(.top, 100)
                } else {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.inquiryList, id: \.inquiryID) { inquiry in
                            InquiryListRow(
                                id: inquiry.inquiryID,
                                title: inquiry.question,
                                date: inquiry.createdAt,
                                userID: inquiry.userID,
                                name: inquiry.username,
                                state: inquiry.answerStatus,
                                authority: viewModel.authority
                            )
                            .onTapGesture {
                                viewModel.updateInquiryID(inquiryID: inquiry.inquiryID)
                                viewModel.updateIsPresentedInquiryDetailView(isPresented: true)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 28)

            ZStack(alignment: .center) {
                if viewModel.isPresentedFilter {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            viewModel.updateIsPresentedFilter(isPresented: false)
                        }

                    AnswerFilterPopup(
                        answerList: viewModel.answerList,
                        selectedAnswer: viewModel.selectedAnswer
                    ) { answer in
                        viewModel.selectedAnswer = answer
                        viewModel.updateAnswerStatus(answer: answer)
                        viewModel.onAppear()
                    } cancel: { cancle in
                        viewModel.updateIsPresentedFilter(isPresented: cancle)
                    }
                    .padding(.horizontal, 28)
                }
            }
            .zIndex(1)
        }
        .refreshable {
            viewModel.onAppear()
        }
        .navigationTitle("문의사항")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if viewModel.authority != .admin {
                    Button {
                        viewModel.updateIsPresentedInputInquiryView(isPresented: true)
                    } label: {
                        BitgouelAsset.Icons.add.swiftUIImage
                    }
                }
            }
        }
        .navigate(
            to: inputInquiryFactory.makeView(state: "추가", inquiryID: "").eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputInquiryView },
                set: { isPresented in
                    viewModel.updateIsPresentedInputInquiryView(isPresented: isPresented)
                }
            )
        )
        .onChange(of: viewModel.isPresentedInputInquiryView) { newValue in
            tabbarHidden.wrappedValue = newValue
        }
        .navigate(
            to: inquiryDetailFactory.makeView(inquiryID: viewModel.inquiryID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInquiryDetailView },
                set: { isPresented in
                    viewModel.updateIsPresentedInquiryDetailView(isPresented: isPresented)
                }
            )
        )
        .onChange(of: viewModel.isPresentedInquiryDetailView) { newValue in
            tabbarHidden.wrappedValue = newValue
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
