import SwiftUI

public protocol AdminWithdrawUserListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
