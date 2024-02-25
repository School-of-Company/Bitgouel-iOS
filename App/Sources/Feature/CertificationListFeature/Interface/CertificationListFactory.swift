import SwiftUI

public protocol CertificationListFactory {
    associatedtype SomeView: View
    func makeView(userID: String) -> SomeView
}
