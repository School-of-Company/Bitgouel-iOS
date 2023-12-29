import SwiftUI

public protocol ActivityListFactory {
    associatedtype SomeView: View
    func makeView(studentID: UUID) -> SomeView
}
