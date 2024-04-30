import NeedleFoundation
import Service
import SwiftUI

public protocol LectureApplicantListDependency: Dependency {
    var fetchApplicantListUseCase: any FetchApplicantListUseCase { get }
}

public final class LectureApplicantListComponent: Component<LectureApplicantListDependency>,
    LectureApplicantListFactory {
    public func makeView(lectureID: String) -> some View {
        LectureApplicantListView(
            viewModel: LectureApplicantListViewModel(
                lectureID: lectureID,
                fetchApplicantListUseCase: dependency.fetchApplicantListUseCase
            )
        )
    }
}
