import SwiftUI

public protocol LectureListFactory {
    associatedtype SomeView: View
    func makeView(selection: Binding<TabFlow>) -> SomeView
}
