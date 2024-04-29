import SwiftUI

public protocol StudentInfoFactory {
    associatedtype SomeView: View
    func makeView(
        clubID: Int,
        studentID: String
    ) -> SomeView
}
