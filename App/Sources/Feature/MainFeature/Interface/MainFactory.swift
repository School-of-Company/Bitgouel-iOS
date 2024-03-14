import SwiftUI

public protocol MainFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
