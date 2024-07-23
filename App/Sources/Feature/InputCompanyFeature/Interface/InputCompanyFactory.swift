import SwiftUI

public protocol InputCompanyFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
