import NeedleFoundation
import Service
import SwiftUI

public protocol ClubdetailDependency: Dependency {
    var studentInfoFactory: any StudentInfoFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchClubDetailUseCase: any FetchClubDetailUseCase { get }
    var fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase { get }
    var fetchMyInfoUseCase: any FetchMyInfoUseCase { get }
}

public final class ClubDetailComponent: Component<ClubdetailDependency>, ClubDetailFactory {
    public func makeView(clubID: Int) -> some View {
        ClubDetailView(
            viewModel: .init(
                clubID: clubID,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                fetchClubDetailUseCase: dependency.fetchClubDetailUseCase,
                fetchStudentListByClubUseCase: dependency.fetchStudentListByClubUseCase,
                fetchMyInfoUseCase: dependency.fetchMyInfoUseCase
            ),
            studentInfoFactory: dependency.studentInfoFactory
        )
    }
}
