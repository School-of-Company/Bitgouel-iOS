import SwiftUI

public protocol LectureOpenApplyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
