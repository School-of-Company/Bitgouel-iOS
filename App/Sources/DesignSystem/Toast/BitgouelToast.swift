import SwiftUI

public extension View {
    func bitgouelToast(
        text: String,
        isShowing: Binding<Bool>
    ) -> some View {
        self.modifier(BitgouelToast(text: text, isShowing: isShowing))
    }
}

public struct BitgouelToast: ViewModifier {
    var text: String
    @Binding var isShowing: Bool

    public init(
        text: String,
        isShowing: Binding<Bool>
    ) {
        self.text = text
        _isShowing = isShowing
    }

    public func body(content: Content) -> some View {
        ZStack {
            content

            toastView()
        }
        .onChange(of: isShowing) { _ in
            if isShowing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
        }
    }

    @ViewBuilder
    func toastView() -> some View {
        VStack {
            Spacer()

            if isShowing {
                Text(text)
                    .bitgouelFont(.text3, color: .greyscale(.g10))
                    .padding(8)
                    .background(Color.bitgouel(.greyscale(.g4)))
                    .cornerRadius(8)
                    .opacity(isShowing ? 1 : 0)
                    .transition(.move(edge: .top).combined(with: AnyTransition.opacity.animation(.easeInOut)))
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
            }
        }
        .animation(.interpolatingSpring(mass: 1, stiffness: 562.5, damping: 15), value: isShowing)
    }
}
