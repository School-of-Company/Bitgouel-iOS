import SwiftUI
import NeedleFoundation
import Service

public protocol LectureListDetailDependency: Dependency {
    var queryLectureDetailUseCase: any QueryLectureDetailUseCase { get }
    var lectureApplyUseCase: any LectureApplyUseCase { get }
    var lectureCancelUseCase: any LectureCancleUseCase { get }
}

public final class LectureListDetailComponent: Component<LectureListDetailDependency>, LectureListDetailFactory {
    @MainActor
    public func makeView(userID: String) -> some View {
        LectureListDetailView(
            viewModel: .init(
                userID: userID,
                queryLectureDetailUseCase: self.dependency.queryLectureDetailUseCase,
                lectureApplyUseCase: self.dependency.lectureApplyUseCase,
                lectureCancleUseCase: self.dependency.lectureCancelUseCase
            )
        )
    }
}
