import NeedleFoundation
import Service
import SwiftUI

public protocol InputCertificationDependency: Dependency {}

public final class InputCertificationComponent: Component<InputCertificationDependency> , InputCertificationFactory {
    public func makeView(
        certificationName: String,
        acquisitionDate: Date,
        completion: @escaping (String, Date) -> Void
    ) -> some View {
        InputCertificationView(
            viewModel: .init(
                certificationName: certificationName,
                acquisitionDate: acquisitionDate,
                completion: completion
            )
        )
    }
}
