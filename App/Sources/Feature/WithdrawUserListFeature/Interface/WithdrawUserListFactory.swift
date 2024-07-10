import SwiftUI

public protocol WithdrawUserListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
