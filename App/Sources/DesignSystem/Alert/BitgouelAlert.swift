import SwiftUI

public extension View {
    func bitgouelAlert(
        title: String,
        description: String,
        isShowing: Binding<Bool>,
        alertActions: [BitgouelAlertButtonType]
    ) -> some View {
        modifier(
            BitgouelAlertModifier(
                title: title,
                description: description,
                isShowing: isShowing,
                alertActions: alertActions
            )
        )
    }
}

struct BitgouelAlertModifier: ViewModifier {
    var title: String
    var description: String
    @Binding var isShowing: Bool
    var alertActions: [BitgouelAlertButtonType]

    public init(
        title: String,
        description: String,
        isShowing: Binding<Bool>,
        alertActions: [BitgouelAlertButtonType]
    ) {
        self.title = title
        self.description = description
        _isShowing = isShowing
        self.alertActions = alertActions
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            if isShowing {
                Color.bitgouel(.greyscale(.g0))
                    .opacity(0.25)
                    .ignoresSafeArea()

                bitgouelAlert()
                    .padding(29)
                    .transition(
                        .asymmetric(
                            insertion: AnyTransition.move(edge: .bottom),
                            removal: .move(edge: .bottom).combined(with: .opacity)
                        )
                    )
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: isShowing ? 0.7 : 0.6, blendDuration: 40), value: isShowing)
    }

    @ViewBuilder
    func bitgouelAlert() -> some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 16) {
                Text(title)
                    .bitgouelFont(.text1)

                Text(description)
                    .bitgouelFont(.caption, color: .greyscale(.g4))
                    .lineSpacing(3)
                    .lineLimit(3)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)

            HStack {
                ForEach(alertActions, id: \.id) { button in
                    CTAButton(text: button.text, style: button.style, action: button.action)
                }
            }
        }
        .padding(.top, 16)
        .background(Color.bitgouel(.greyscale(.g10)))
        .cornerRadius(8)
    }
}
