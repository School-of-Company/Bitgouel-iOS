import SwiftUI

public protocol LectureOpeningApplyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
