import NeedleFoundation
import SwiftUI

public protocol InputSchoolDependency: Dependency {}

public final class InputSchoolComponent: Component<InputSchoolDependency>, InputSchoolFactory {
    public func makeView(state: String, schoolInfo: SchoolDetailInfoModel) -> some View {
        InputSchoolView(
            viewModel: .init(
                state: state,
                schoolInfo: schoolInfo
            )
        )
    }
}
