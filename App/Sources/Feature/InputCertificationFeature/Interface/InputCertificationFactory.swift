import SwiftUI

public protocol InputCertificationFactory {
    associatedtype SomeView: View
    func makeView(
        certificationName: String,
        acquisitionDate: Date,
        completion: @escaping (String, Date) -> Void
    ) -> SomeView
}
