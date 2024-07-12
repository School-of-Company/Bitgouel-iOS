import SwiftUI

public protocol UniversityListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
