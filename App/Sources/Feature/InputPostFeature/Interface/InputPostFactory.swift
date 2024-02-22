import SwiftUI

public protocol InputPostFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
