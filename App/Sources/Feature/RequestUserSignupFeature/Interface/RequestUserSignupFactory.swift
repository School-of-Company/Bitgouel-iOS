import SwiftUI

public protocol RequestUserSignupFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
