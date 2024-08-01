import NeedleFoundation
import SwiftUI
import Service

public protocol InputSchoolDependency: Dependency {
    var createdSchoolUseCase: any CreatedSchoolUseCase { get }
    var modifySchoolUseCase: any ModifySchoolUseCase { get }
    var deleteSchoolUseCase: any DeleteSchoolUseCase { get }
    var inputClubFactory: any InputClubFactory { get }
}

public final class InputSchoolComponent: Component<InputSchoolDependency>, InputSchoolFactory {
    public func makeView(
        state: String,
        schoolInfo: SchoolDetailInfoModel
    ) -> some View {
        InputSchoolView(
            viewModel: .init(
                state: state,
                schoolInfo: schoolInfo,
                createdSchoolUseCase: dependency.createdSchoolUseCase,
                modifySchoolUseCase: dependency.modifySchoolUseCase,
                deleteSchoolUseCase: dependency.deleteSchoolUseCase
            ), inputClubFactory: dependency.inputClubFactory
        )
    }
}
