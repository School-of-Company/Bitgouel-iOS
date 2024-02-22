import SwiftUI

struct InputPostView: View {
    @State var postTitle: String = ""
    @State var postText: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            InputFormView(
                epic: "게시글",
                state: "추가",
                settingButtonAction: {
                    
                },
                finalButtonAction: {
                    
                },
                title: Binding(get: {
                    postTitle
                }, set: { title in
                    postTitle = title
                }),
                text: Binding(get: {
                    postText
                }, set: { text in
                    postText = text
                })
            )
        }
    }
}
