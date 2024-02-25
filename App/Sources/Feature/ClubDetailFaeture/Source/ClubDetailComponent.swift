import NeedleFoundation
import Service
import SwiftUI

public protocol ClubdetailDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryClubDetailUseCase: any QueryClubDetailUseCase { get }
    var queryStudentListByClubUseCase: any QueryStudentListByClubUseCase { get }
}

public final class ClubDetailComponent: Component<ClubdetailDependency>, ClubDetailFactory {
    public func makeView(clubID: Int) -> some View {
        ClubDetailView(
            viewModel: .init(
                clubID: clubID,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryClubDetailUseCase: dependency.queryClubDetailUseCase,
                queryStudentListByClubUseCase: dependency.queryStudentListByClubUseCase
            )
        )
    }
}
