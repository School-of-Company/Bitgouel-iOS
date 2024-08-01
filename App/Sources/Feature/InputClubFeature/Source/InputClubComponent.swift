import NeedleFoundation
import SwiftUI
import Service

public protocol InputClubDependency: Dependency {
    var createdClubUseCase: any CreatedClubUseCase { get }
    var deleteClubUseCase: any DeleteClubUseCase { get }
    var modifyClubUseCase: any ModifyClubUseCase { get }
}

public final class InputClubComponent: Component<InputClubDependency>, InputClubFactory {
    public func makeView(
        schoolID: Int,
        state: String,
        clubInfo: ClubDetailModel
    ) -> some View {
        InputClubView(
            viewModel: .init(
                schoolID: schoolID,
                state: state,
                clubInfo: clubInfo,
                createdClubUseCase: dependency.createdClubUseCase,
                deleteClubUseCase: dependency.deleteClubUseCase,
                modifyClubUseCase: dependency.modifyClubUseCase
            )
        )
    }
}
