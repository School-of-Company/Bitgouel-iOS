import SwiftUI

public protocol PostListFactory {
    associatedtype SomView: View
    func makeView() -> SomView
}
