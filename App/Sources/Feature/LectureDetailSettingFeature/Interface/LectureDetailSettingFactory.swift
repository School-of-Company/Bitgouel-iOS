import SwiftUI

public protocol LectureDetailSettingFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
