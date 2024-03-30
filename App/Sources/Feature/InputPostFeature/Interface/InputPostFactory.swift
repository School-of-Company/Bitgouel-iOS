import SwiftUI

public protocol InputPostFactory {
    associatedtype SomeView: View
    func makeView(
        state: String,
        postID: String
    ) -> SomeView
}
