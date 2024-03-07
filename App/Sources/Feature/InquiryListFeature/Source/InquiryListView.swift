import SwiftUI

struct InquiryListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: InquiryListViewModel
    init(viewModel: InquiryListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
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
            .navigationTitle("문의사항")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if viewModel.authority == .admin {
                        Button {
                            
                        } label: {
                            BitgouelAsset.Icons.filter.swiftUIImage
                        }
                    } else {
                        Button {
                            
                        } label: {
                            BitgouelAsset.Icons.add.swiftUIImage
                        }
                    }
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
        .padding(.horizontal, 28)
    }
}
