import SwiftUI

public protocol OpenedLectureFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
