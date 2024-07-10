import SwiftUI

public protocol UserListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
