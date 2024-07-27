import NeedleFoundation
import SwiftUI

public protocol InputUniversityDependency: Dependency {}

public final class InputUniversityComponent: Component<InputUniversityDependency>, InputUniversityFactory {
    public func makeView(
        state: String,
        universityName: String,
        departmentList: [String],
        universityID: Int
    ) -> some View {
        InputUniversityView(
            viewModel: .init(
                state: state,
                universityName: universityName,
                departmentList: departmentList,
                universityID: universityID
            )
        )
    }
}
