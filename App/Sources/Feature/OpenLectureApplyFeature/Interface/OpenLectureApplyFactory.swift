import SwiftUI

public protocol OpenLectureApplyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
