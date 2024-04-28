import NeedleFoundation
import Service
import SwiftUI

public protocol LectureListDetailDependency: Dependency {
    var fetchLectureDetailUseCase: any FetchLectureDetailUseCase { get }
    var applyLectureUseCase: any ApplyLectureUseCase { get }
    var cancelLectureUseCase: any CancelLectureUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var lectureApplicantListFactory: any LectureApplicantListFactory { get }
}

public final class LectureListDetailComponent: Component<LectureListDetailDependency>, LectureListDetailFactory {
    @MainActor
    public func makeView(lectureID: String) -> some View {
        LectureListDetailView(
            viewModel: .init(
                lectureID: lectureID,
                fetchLectureDetailUseCase: dependency.fetchLectureDetailUseCase,
                applyLectureUseCase: dependency.applyLectureUseCase,
                cancelLectureUseCase: dependency.cancelLectureUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase
            ),
            lectureApplicantListFactory: dependency.lectureApplicantListFactory
        )
    }
}
