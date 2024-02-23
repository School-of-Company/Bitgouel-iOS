import SwiftUI

public protocol EditPostFactory {
    associatedtype SomeView: View
    func makeView(postID: String) -> SomeView
}
