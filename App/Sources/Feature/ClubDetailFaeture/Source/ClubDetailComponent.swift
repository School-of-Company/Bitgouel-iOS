import NeedleFoundation
import Service
import SwiftUI

public protocol ClubdetailDependency: Dependency {
    var certificationListFactory: any CertificationListFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryClubDetailUseCase: any QueryClubDetailUseCase { get }
    var queryStudentListByClubUseCase: any QueryStudentListByClubUseCase { get }
    var fetchMyInfoUseCase: any FetchMyInfoUseCase { get }
}

public final class ClubDetailComponent: Component<ClubdetailDependency>, ClubDetailFactory {
    public func makeView(clubID: Int) -> some View {
        ClubDetailView(
            viewModel: .init(
                clubID: clubID,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryClubDetailUseCase: dependency.queryClubDetailUseCase,
                queryStudentListByClubUseCase: dependency.queryStudentListByClubUseCase,
                fetchMyInfoUseCase: dependency.fetchMyInfoUseCase
            ),
            certificationListFactory: dependency.certificationListFactory
        )
    }
}
