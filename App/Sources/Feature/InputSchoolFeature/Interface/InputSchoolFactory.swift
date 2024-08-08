import SwiftUI

public protocol InputSchoolFactory {
    associatedtype SomeView: View
    func makeView(
        state: String,
        schoolID: Int
    ) -> SomeView
}
