import SwiftUI

public protocol ActivityDetailFactory {
    associatedtype SomeView: View
    func makeView(activityId: String) -> SomeView
}
