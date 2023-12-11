import SwiftUI

public struct ConditionView<Content>: View where Content: View {
    private let condition: Bool
    private let content: () -> Content

    public init(_ condition: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.condition = condition
        self.content = content
    }

    public var body: some View {
        if condition {
            content()
        }
    }
}

public extension View {
    func conditional(_ condition: Bool) -> some View {
        ConditionView(condition) {
            self
        }
    }
}
