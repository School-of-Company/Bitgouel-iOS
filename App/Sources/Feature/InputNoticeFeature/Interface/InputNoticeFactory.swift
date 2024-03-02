import SwiftUI

public protocol InputNoticeFactory {
    associatedtype SomeView: View
    func makeView(state: String) -> SomeView
}
