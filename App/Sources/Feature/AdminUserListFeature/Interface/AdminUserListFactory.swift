import SwiftUI

public protocol AdminUserListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
