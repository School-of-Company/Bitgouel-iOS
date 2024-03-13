import SwiftUI

struct InquiryListView: View {
    @Environment(\.dismiss) var dismiss
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
            VStack {
                if viewModel.authority == .admin {
                    KeywordSearchBar(
                        text: Binding(
                            get: { viewModel.keyword },
                            set: { text in viewModel.updateKeyword(text: text) }
                        ),
                        prompt: "키워드로 검색...") {
                            viewModel.updateIsPresentedFilter(isPresented: true)
                        }
                }
                
                Spacer()
                
                ScrollView {
                    VStack(spacing: 12) {
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
        .navigate(
            to: inquiryDetailFactory.makeView(inquiryID: viewModel.inquiryID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInquiryDetailView },
                set: { isPresented in
                    viewModel.updateIsPresentedInquiryDetailView(isPresented: isPresented)
                }
            )
        )
        .onAppear {
            viewModel.onAppear()
        }
    }
}
