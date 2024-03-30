import SwiftUI

public protocol MyPageFactory {
    associatedtype SomeView: View
    func makeView(selection: Binding<TabFlow>) -> SomeView
}
