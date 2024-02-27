import SwiftUI

struct NoticeListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NoticeListViewModel
    
    private let inquiryListFactory: any InquiryListFactory
    
    init(
        viewModel: NoticeListViewModel,
        inquiryListFactory: any InquiryListFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inquiryListFactory = inquiryListFactory
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                LazyVStack(spacing: 0) {
                    ListRow(
                        id: "공지사항",
                        title: "어쩌구 저쩌구",
                        modifiedAt: Date()
                    )
                    
                    Divider()
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
        }
        .refreshable {
            viewModel.onAppear()
        }
    }
}
