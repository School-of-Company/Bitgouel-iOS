import SwiftUI

public protocol CertificationListFactory {
    associatedtype SomeView: View
    func makeView(clubID: String, studentID: String) -> SomeView
}
