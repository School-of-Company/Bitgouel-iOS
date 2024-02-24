import SwiftUI

public protocol SuccessSignUpFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
