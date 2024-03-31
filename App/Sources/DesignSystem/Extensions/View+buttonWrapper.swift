import SwiftUI

public extension View {
    func buttonWrapper(_ action: @escaping () -> Void) -> some View {
        Button(action: action) {
            self
        }
    }
}
