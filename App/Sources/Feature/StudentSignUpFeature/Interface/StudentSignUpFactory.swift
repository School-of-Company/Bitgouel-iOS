import SwiftUI

public protocol StudentSignUpFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
