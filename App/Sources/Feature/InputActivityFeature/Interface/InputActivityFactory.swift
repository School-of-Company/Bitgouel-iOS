import SwiftUI

public protocol InputActivityFactory {
    associatedtype SomeView: View
    func makeView(
        state: String,
        activityID: String
    ) -> SomeView
}
