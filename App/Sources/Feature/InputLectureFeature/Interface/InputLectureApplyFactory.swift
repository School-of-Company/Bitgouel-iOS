import SwiftUI

public protocol InputLectureFactory {
    associatedtype SomeView: View
    func makeView(
        state: String,
        lectureID: String
    ) -> SomeView
}
