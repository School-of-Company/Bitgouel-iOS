import NeedleFoundation
import Service
import SwiftUI

public protocol InputUniversityDependency: Dependency {
    var createdUniversityUseCase: any CreatedUniversityUseCase { get }
    var modifyUniversityUseCase: any ModifyUniversityUseCase { get }
    var deleteUniversityUseCase: any DeleteUniversityUseCase { get }
    var createdDepartmentUseCase: any CreatedDepartmentUseCase { get }
    var deleteDepartmentUseCase: any DeleteDepartmentUseCase { get }
}

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
                universityID: universityID,
                createdUniversityUseCase: dependency.createdUniversityUseCase,
                modifyUniversityUseCase: dependency.modifyUniversityUseCase,
                deleteUniversityUseCase: dependency.deleteUniversityUseCase,
                createdDepartmentUseCase: dependency.createdDepartmentUseCase,
                deleteDepartmentUseCase: dependency.deleteDepartmentUseCase
            )
        )
    }
}
