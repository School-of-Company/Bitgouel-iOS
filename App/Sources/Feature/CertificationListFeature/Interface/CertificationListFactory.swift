import SwiftUI

public protocol CertificationListFactory {
    associatedtype SomeView: View
    func makeView(studentID: String) -> SomeView
}
