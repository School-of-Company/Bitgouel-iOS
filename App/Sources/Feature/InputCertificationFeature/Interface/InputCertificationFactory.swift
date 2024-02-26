import SwiftUI

public protocol InputCertificationFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
