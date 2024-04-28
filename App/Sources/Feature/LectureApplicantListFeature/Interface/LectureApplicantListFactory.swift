import SwiftUI

public protocol LectureApplicantListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
