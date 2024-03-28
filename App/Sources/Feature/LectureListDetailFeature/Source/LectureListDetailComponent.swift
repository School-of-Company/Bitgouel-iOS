import NeedleFoundation
import Service
import SwiftUI

public protocol LectureListDetailDependency: Dependency {
    var fetchLectureDetailUseCase: any FetchLectureDetailUseCase { get }
    var applyLectureUseCase: any ApplyLectureUseCase { get }
    var cancelLectureUseCase: any CancelLectureUseCase { get }
}

public final class LectureListDetailComponent: Component<LectureListDetailDependency>, LectureListDetailFactory {
    @MainActor
    public func makeView(lectureID: String) -> some View {
        LectureListDetailView(
            viewModel: .init(
                lectureID: lectureID,
                fetchLectureDetailUseCase: dependency.fetchLectureDetailUseCase,
                applyLectureUseCase: dependency.applyLectureUseCase,
                cancelLectureUseCase: dependency.cancelLectureUseCase
            )
        )
    }
}
