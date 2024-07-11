import SwiftUI

public protocol AdminRootFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
