import SwiftUI

struct AlterBottomSheet: ViewModifier {
    @Binding var isShowing: Bool
    @Environment(\.safeAreaInsets) var safeAreaInsets

    var deleteAction: () -> Void
    var editAction: () -> Void
    var cornerRadius: CGFloat
    var sheetDragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onEnded { value in
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
        deleteAction: @escaping () -> Void,
        editAction: @escaping () -> Void
    ) {
        _isShowing = isShowing
        self.cornerRadius = cornerRadius
        self.deleteAction = deleteAction
        self.editAction = editAction
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
                            .gesture(sheetDragGesture)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            BitgouelText(
                                text: "수정 및 삭제",
                                font: .title3
                            )
                            
                            HStack(spacing: 8) {
                                CTAButton(text: "삭제하기", style: .error) {
                                    deleteAction()
                                }
                                
                                CTAButton(text: "수정하기", style: .default) {
                                    editAction()
                                }
                            }
                        }
                        .padding(.top, 24)
                        .padding(.horizontal, 32)
                        .padding(.bottom, 80)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .bottom))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .animation(.default, value: isShowing)
        }
    }
}

public extension View {
    func alterBottomSheet(
        isShowing: Binding<Bool>,
        cornerRadius: CGFloat = 8,
        deleteAction: @escaping () -> Void = {},
        editAction: @escaping () -> Void = {}
    ) -> some View {
        modifier(AlterBottomSheet(
            isShowing: isShowing,
            cornerRadius: cornerRadius,
            deleteAction: deleteAction,
            editAction: editAction
        ))
    }
}
