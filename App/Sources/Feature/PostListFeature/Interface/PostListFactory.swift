import SwiftUI

public protocol PostListFactory {
    associatedtype SomView: View
    func makeView(selection: Binding<TabFlow>) -> SomView
}
