import SwiftUI

public protocol CertificationListFactory {
    associatedtype SomeView: View
    func makeView(
        clubID: Int,
        studentID: String
    ) -> SomeView
}
