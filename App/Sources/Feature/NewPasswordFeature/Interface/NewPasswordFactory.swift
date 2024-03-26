import SwiftUI

public protocol NewPasswordFactory {
    associatedtype SomeView: View
    func makeView(
        email: String
    ) -> SomeView
}
