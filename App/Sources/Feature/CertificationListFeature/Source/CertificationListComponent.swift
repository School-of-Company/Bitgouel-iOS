import NeedleFoundation
import Service
import SwiftUI

public protocol CertificationListDependency: Dependency {
    var activityListFactory: any ActivityListFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryStudentDetailByClubUseCase: any QueryStudentDetailByClubUseCase { get }
    var queryCertificationListByStudentUseCase: any QueryCertificationListByStudentUseCase { get }
    var queryCertificationListByTeacherUseCase: any QueryCertificationListByTeacherUseCase { get }
}

public final class CertificationListComponent: Component<CertificationListDependency>, CertificationListFactory {
    public func makeView(
        clubID: Int,
        studentID: String
    ) -> some View {
        CertificationListView(
            viewModel: .init(
                clubID: clubID,
                studentID: studentID,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                queryStudentDetailByClubUseCase: dependency.queryStudentDetailByClubUseCase,
                queryCertificationListByStudent: dependency.queryCertificationListByStudentUseCase,
                queryCertificationListByTeacher: dependency.queryCertificationListByTeacherUseCase
            ),
            activityListFactory: dependency.activityListFactory
        )
    }
}
