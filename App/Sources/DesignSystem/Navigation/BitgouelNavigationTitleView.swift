import SwiftUI

public struct BitgouelNavigationTitleView<Content: View>: View {
    var title: String
    var buttonItems: [ButtonItem]
    var content: () -> Content
    
    public init(
        title: String,
        buttonItems: [ButtonItem],
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.buttonItems = buttonItems
        self.content = content
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                HStack {
                    BitgouelText(
                        text: title,
                        font: .title2
                    )
                    
                    Spacer()
                    
                    ForEach(buttonItems, id: \.id) { buttonItem in
                        ButtonItemView(buttonItem: buttonItem)
                    }
                }
                
                content()
            }
        }
        .padding(.horizontal, 28)
    }
}

public struct ButtonItem {
    let id = UUID()
    let image: String
    let text: String
    
    public init(image: String, text: String) {
        self.image = image
        self.text = text
    }
}

public struct ButtonItemView: View {
    var buttonItem: ButtonItem
    
    public var body: some View {
        HStack {
            Image(buttonItem.image)
                .resizable()
                .frame(width: 20, height: 20)
                .padding()

            Text(buttonItem.text)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
    }
}
