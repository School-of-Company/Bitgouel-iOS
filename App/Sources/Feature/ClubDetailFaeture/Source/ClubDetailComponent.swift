import NeedleFoundation
import SwiftUI
import Service

public protocol ClubdetailDependency: Dependency {
    var certificationListFactory: any CertificationListFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryClubDetailUseCase: any QueryClubDetailUseCase { get }
    var queryStudentListByClubUseCase: any QueryStudentListByClubUseCase { get }
}

public final class ClubDetailComponent: Component<ClubdetailDependency>, ClubDetailFactory {
    public func makeView(clubID: String) -> some View {
        ClubDetailView(
            viewModel: .init(
                clubID: clubID,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryClubDetailUseCase: dependency.queryClubDetailUseCase,
                queryStudentListByClubUseCase: dependency.queryStudentListByClubUseCase
            ),
            certificationListFactory: dependency.certificationListFactory
        )
    }
}
