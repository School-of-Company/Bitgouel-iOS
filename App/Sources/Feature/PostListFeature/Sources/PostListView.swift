import SwiftUI

struct PostListView: View {
    @StateObject var viewModel: PostListViewModel
    
    init(viewModel: PostListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
            .padding(.horizontal, 28)
            .alterBottomSheet(isShowing: $viewModel.isPresentedAleterBottomSheet)
            .navigationTitle("게시글 목록")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {} label: {
                        BitgouelAsset.Icons.megaphone.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    
                    Button {} label: {
                        BitgouelAsset.Icons.questionmark.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    
                    Button {} label: {
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
