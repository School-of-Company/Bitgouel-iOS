import NeedleFoundation
import Service
import SwiftUI

public protocol ClubListDependency: Dependency {
    var queryClubListUseCase: any QueryClubListUseCase { get }
    var clubDetailFactory: any ClubDetailFactory { get }
}

public final class ClubListComponent: Component<ClubListDependency>, ClubListFactory {
    public func makeView() -> some View {
        ClubListView(
            viewModel: .init(
                queryClubListUseCase: dependency.queryClubListUseCase
            ),
            clubDetailFactory: dependency.clubDetailFactory
        )
    }
}
