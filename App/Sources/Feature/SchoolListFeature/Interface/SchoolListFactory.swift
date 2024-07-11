import SwiftUI

public protocol SchoolListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
