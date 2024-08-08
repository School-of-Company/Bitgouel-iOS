import NeedleFoundation
import Service
import SwiftUI

public protocol LectureApplicantListDependency: Dependency {
    var fetchApplicantListUseCase: any FetchApplicantListUseCase { get }
    var setLectureCompletionUseCase: any SetLectureCompletionUseCase { get }
    var fetchAppliedLectureStudentDetailUseCase: any FetchAppliedLectureStudentDetailUseCase { get }
}

public final class LectureApplicantListComponent: Component<LectureApplicantListDependency>,
    LectureApplicantListFactory {
    public func makeView(lectureID: String) -> some View {
        LectureApplicantListView(
            viewModel: LectureApplicantListViewModel(
                lectureID: lectureID,
                fetchApplicantListUseCase: dependency.fetchApplicantListUseCase,
                setLectureCompletionUseCase: dependency.setLectureCompletionUseCase,
                fetchAppliedLectureStudentDetailUseCase: dependency.fetchAppliedLectureStudentDetailUseCase
            )
        )
    }
}
