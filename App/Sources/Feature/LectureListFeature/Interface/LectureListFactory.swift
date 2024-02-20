import SwiftUI

public protocol LectureListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
