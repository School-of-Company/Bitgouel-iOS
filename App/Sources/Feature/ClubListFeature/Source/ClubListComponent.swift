import NeedleFoundation
import Service
import SwiftUI

public protocol ClubListDependency: Dependency {
    var fetchClubListUseCase: any FetchClubListUseCase { get }
    var fetchSchoolListUseCase: any FetchSchoolListUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var clubDetailFactory: any ClubDetailFactory { get }
}

public final class ClubListComponent: Component<ClubListDependency>, ClubListFactory {
    public func makeView(selection: Binding<TabFlow>) -> some View {
        ClubListView(
            viewModel: .init(
                fetchClubListUseCase: dependency.fetchClubListUseCase,
                fetchSchoolListUseCase: dependency.fetchSchoolListUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase
            ),
            clubDetailFactory: dependency.clubDetailFactory,
            selection: selection
        )
    }
}
