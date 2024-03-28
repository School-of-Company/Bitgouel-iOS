import SwiftUI

public protocol LectureListDetailFactory {
    associatedtype SomeView: View
    func makeView(lectureID: String) -> SomeView
}
