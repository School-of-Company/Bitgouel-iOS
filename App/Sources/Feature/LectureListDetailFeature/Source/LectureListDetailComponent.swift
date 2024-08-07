import NeedleFoundation
import Service
import SwiftUI

public protocol LectureListDetailDependency: Dependency {
    var fetchLectureDetailUseCase: any FetchLectureDetailUseCase { get }
    var applyLectureUseCase: any ApplyLectureUseCase { get }
    var cancelLectureApplicationUseCase: any CancelLectureApplicationUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var lectureApplicantListFactory: any LectureApplicantListFactory { get }
    var deleteLectureUseCase: any DeleteLectureUseCase { get }
    var inputLectureFactory: any InputLectureFactory { get }
}

public final class LectureListDetailComponent: Component<LectureListDetailDependency>, LectureListDetailFactory {
    @MainActor
    public func makeView(lectureID: String) -> some View {
        LectureListDetailView(
            viewModel: .init(
                lectureID: lectureID,
                fetchLectureDetailUseCase: dependency.fetchLectureDetailUseCase,
                applyLectureUseCase: dependency.applyLectureUseCase,
                cancelLectureApplicationUseCase: dependency.cancelLectureApplicationUseCase,
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                deleteLectureUseCase: dependency.deleteLectureUseCase
            ),
            lectureApplicantListFactory: dependency.lectureApplicantListFactory,
            inputLectureFactory: dependency.inputLectureFactory
        )
    }
}
