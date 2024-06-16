import NeedleFoundation
import Service
import SwiftUI

public protocol StudentInfoDependency: Dependency {
    var activityListFactory: any ActivityListFactory { get }
    var inputCertificationFactory: any InputCertificationFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchStudentDetailByClubUseCase: any FetchStudentDetailByClubUseCase { get }
    var fetchCertificationListByStudentUseCase: any FetchCertificationListByStudentUseCase { get }
    var fetchCertificationListByTeacherUseCase: any FetchCertificationListByTeacherUseCase { get }
    var fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase { get }
}

public final class StudentInfoComponent: Component<StudentInfoDependency>, StudentInfoFactory {
    @MainActor
    public func makeView(
        clubID: Int,
        studentID: String
    ) -> some View {
        StudentInfoView(
            viewModel: .init(
                clubID: clubID,
                studentID: studentID,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                fetchStudentDetailByClubUseCase: dependency.fetchStudentDetailByClubUseCase,
                fetchCertificationListByStudent: dependency.fetchCertificationListByStudentUseCase,
                fetchCertificationListByTeacher: dependency.fetchCertificationListByTeacherUseCase,
                fetchAppliedLectureListUseCase: dependency.fetchAppliedLectureListUseCase
            ),
            activityListFactory: dependency.activityListFactory,
            inputCertificationFactory: dependency.inputCertificationFactory
        )
    }
}
