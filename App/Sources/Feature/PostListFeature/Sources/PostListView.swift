import SwiftUI

struct PostListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    LazyVStack(spacing: 0) {
                        ForEach(0...3, id: \.self) { index in
                            PostListRow(
                                postId: "index",
                                title: "타이틀",
                                modifedAt: "날짜"
                            )
                            
                            Divider()
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 28)
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
