import NeedleFoundation
import SwiftUI
import Service

public protocol ClubdetailDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryClubDetailUseCase: any QueryClubDetailUseCase { get }
    var queryStudentListByClubUseCase: any QueryStudentListByClubUseCase { get }
}

public final class ClubDetailComponent: Component<ClubdetailDependency>, ClubDetailFactory {
    public func makeView(clubId: String) -> some View {
        ClubDetailView(
            viewModel: .init(
                clubId: clubId,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryClubDetailUseCase: dependency.queryClubDetailUseCase,
                queryStudentListByClubUseCase: dependency.queryStudentListByClubUseCase
            )
        )
    }
}
