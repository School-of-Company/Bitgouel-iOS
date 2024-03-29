import NeedleFoundation
import Service
import SwiftUI

public protocol ClubListDependency: Dependency {
    var queryClubListUseCase: any QueryClubListUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var clubDetailFactory: any ClubDetailFactory { get }
}

public final class ClubListComponent: Component<ClubListDependency>, ClubListFactory {
    public func makeView(selection: Binding<TabFlow>) -> some View {
        ClubListView(
            viewModel: .init(
                queryClubListUseCase: dependency.queryClubListUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase
            ),
            clubDetailFactory: dependency.clubDetailFactory,
            selection: selection
        )
    }
}
