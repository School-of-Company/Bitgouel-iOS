import NeedleFoundation
import SwiftUI
import Service

public protocol InputSchoolDependency: Dependency {
    var createdSchoolUseCase: any CreatedSchoolUseCase { get }
    var modifySchoolUseCase: any ModifySchoolUseCase { get }
    var deleteSchoolUseCase: any DeleteSchoolUseCase { get }
    var fetchSchoolDetailUseCase: any FetchSchoolDetailUseCase { get }
    var inputClubFactory: any InputClubFactory { get }
}

public final class InputSchoolComponent: Component<InputSchoolDependency>, InputSchoolFactory {
    public func makeView(
        state: String,
        schoolID: Int
    ) -> some View {
        InputSchoolView(
            viewModel: .init(
                state: state,
                schoolID: schoolID,
                fetchSchoolDetailUseCase: dependency.fetchSchoolDetailUseCase,
                createdSchoolUseCase: dependency.createdSchoolUseCase,
                modifySchoolUseCase: dependency.modifySchoolUseCase,
                deleteSchoolUseCase: dependency.deleteSchoolUseCase
            ), 
            inputClubFactory: dependency.inputClubFactory
        )
    }
}
