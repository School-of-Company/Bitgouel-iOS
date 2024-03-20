import SwiftUI

public protocol AdminRequestUserSignupFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
