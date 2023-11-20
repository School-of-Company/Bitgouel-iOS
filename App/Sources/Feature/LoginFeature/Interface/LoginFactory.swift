import SwiftUI

public protocol LoginFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
