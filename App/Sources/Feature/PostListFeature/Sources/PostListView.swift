import SwiftUI

struct PostListView: View {
    @State var isPresentedAleterBottomSheet: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    LazyVStack(spacing: 0) {
                        ForEach(0...3, id: \.self) { index in
                            ListRow(
                                id: "index",
                                title: "타이틀",
                                modifedAt: "날짜",
                                isPresented: Binding(get: {
                                    isPresentedAleterBottomSheet
                                }, set: { isPresented in
                                    isPresentedAleterBottomSheet = isPresented
                                })
                            )
                            
                            Divider()
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 28)
            .alterBottomSheet(isShowing: $isPresentedAleterBottomSheet)
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
