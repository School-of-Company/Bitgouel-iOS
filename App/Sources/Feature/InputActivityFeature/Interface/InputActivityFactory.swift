import SwiftUI

public protocol InputActivityFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
