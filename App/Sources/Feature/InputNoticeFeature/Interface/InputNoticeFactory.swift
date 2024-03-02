import SwiftUI

public protocol InputNoticeFactory {
    associatedtype SomeView: View
    func makeView(epic: String) -> SomeView
}
