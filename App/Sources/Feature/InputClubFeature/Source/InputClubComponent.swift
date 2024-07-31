import NeedleFoundation
import SwiftUI
import Service

public protocol InputClubDependency: Dependency {
    var createdClubUseCase: any CreatedClubUseCase { get }
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
                createdClubUseCase: dependency.createdClubUseCase
            )
        )
    }
}
