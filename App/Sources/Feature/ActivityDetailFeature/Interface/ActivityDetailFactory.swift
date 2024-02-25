import SwiftUI

public protocol ActivityDetailFactory {
    associatedtype SomeView: View
    func makeView(activityID: String) -> SomeView
}
