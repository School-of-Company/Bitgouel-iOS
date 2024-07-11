import SwiftUI

public protocol CompanyListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
