import SwiftUI

public protocol SignUpFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
