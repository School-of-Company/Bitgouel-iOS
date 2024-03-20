import SwiftUI

public protocol SuccessChangePasswordFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
