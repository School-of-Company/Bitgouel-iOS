import SwiftUI

public protocol InputCertificationFactory {
    associatedtype SomeView: View
    func makeView(
        epic: String,
        certificationID: String,
        certificationName: String,
        acquisitionDate: Date
    ) -> SomeView
}
