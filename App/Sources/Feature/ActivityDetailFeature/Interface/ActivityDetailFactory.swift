import SwiftUI

public protocol ActivityDetailFactory {
    associatedtype SomeView: View
    func makeView(userId: String) -> SomeView
}
