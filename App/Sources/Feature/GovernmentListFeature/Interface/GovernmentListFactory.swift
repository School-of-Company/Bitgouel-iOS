import SwiftUI

public protocol GovernmentListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
