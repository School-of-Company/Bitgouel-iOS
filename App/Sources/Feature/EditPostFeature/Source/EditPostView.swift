import SwiftUI

struct EditPostView: View {
    @StateObject var vieWModel: EditPostViewModel
    
    init(vieWModel: EditPostViewModel) {
        _vieWModel = StateObject(wrappedValue: vieWModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                InputFormView(
                    epic: "게시글",
                    state: "수정",
                    settingButtonAction: {
                        
                    },
                    finalButtonAction: {
                        
                    },
                    title: Binding(
                        get: { vieWModel.modifiedTitle },
                        set: { title in vieWModel.updateTitle(title: title) }
                    ),
                    text: Binding(
                        get: { vieWModel.modifiedContent },
                        set: { text in vieWModel.updateContent(content: text) }
                    )
                )
            }
        }
    }
}
