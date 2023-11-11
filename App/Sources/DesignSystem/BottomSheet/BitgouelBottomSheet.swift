import SwiftUI

struct BitgouelBottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    @State private var dragHeight: CGFloat = 0
    @Environment(\.safeAreaInsets) var safeAreaInsets

    var content: () -> T
    var topPadding: CGFloat
    var cornerRadius: CGFloat
    var sheetDragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                withAnimation(.spring()) {
                    dragHeight = min(30, -value.translation.height)
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    dragHeight = 0
                }
                let verticalAmount = value.translation.height
                if verticalAmount > 100 {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
    }

    init(
        isShowing: Binding<Bool>,
        cornerRadius: CGFloat = 8,
        topPadding: CGFloat = .zero,
        content: @escaping () -> T
    ) {
        _isShowing = isShowing
        self.cornerRadius = cornerRadius
        self.topPadding = topPadding
        self.content = content
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            ZStack(alignment: .bottom) {
                if isShowing {
                    Color.black
                        .opacity(0.35)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isShowing = false
                            }
                        }
                        .gesture(sheetDragGesture)
                        .transition(.opacity)

                    ZStack {
                        Color.white
                            .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                            .padding(.top, -dragHeight)
                            .gesture(sheetDragGesture)

                        VStack {
                            self.content()
                                .frame(maxWidth: .infinity)
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 40)
                        .offset(y: -dragHeight)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .bottom))
                    .padding(.top, topPadding)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .animation(.default, value: isShowing)
        }
    }
}

public extension View {
    func bitgouelBottomSheet(
        isShowing: Binding<Bool>,
        cornerRadius: CGFloat = 8,
        topPadding: CGFloat = .zero,
        content: @escaping () -> some View
    ) -> some View {
        modifier(BitgouelBottomSheet(
            isShowing: isShowing,
            cornerRadius: cornerRadius,
            topPadding: topPadding,
            content: content
        ))
    }
}
