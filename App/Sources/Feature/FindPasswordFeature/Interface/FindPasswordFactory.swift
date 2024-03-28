import SwiftUI

public protocol FindPasswordFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
