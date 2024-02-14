import SwiftUI

public protocol ActivityListFactory {
    associatedtype SomeView: View
    func makeView(studentID: String) -> SomeView
}
