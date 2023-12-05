import SwiftUI

public protocol LectureListDetailFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
