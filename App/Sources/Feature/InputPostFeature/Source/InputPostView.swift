import SwiftUI

struct InputPostView: View {
    @State var postTitle: String = ""
    @State var postText: String = ""
    @State var isPresentedPostDetailSettingAppend: Bool = false
    @State var postRelatedLink: [String] = []
    
    private let postDetailSettingFactory: any PostDetailSettingFactory
    
    init(postDetailSettingFactory: any PostDetailSettingFactory) {
        self.postDetailSettingFactory = postDetailSettingFactory
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                InputFormView(
                    epic: "게시글",
                    state: "추가",
                    settingButtonAction: {
                        isPresentedPostDetailSettingAppend = true
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
        .fullScreenCover(
            isPresented: Binding(
                get: { isPresentedPostDetailSettingAppend },
                set: { _ in isPresentedPostDetailSettingAppend = false }
            )
        ) {
            DeferView {
                postDetailSettingFactory.makeView(links: postRelatedLink) {
                    links in
                    postRelatedLink = links
                }.eraseToAnyView()
            }
        }
    }
}
