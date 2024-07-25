import SwiftUI

public protocol InputUniversityFactory {
    associatedtype SomeView: View
    func makeView(state: String) -> SomeView
}
