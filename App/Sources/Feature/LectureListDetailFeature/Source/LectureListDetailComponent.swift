import SwiftUI
import NeedleFoundation
import Service

public protocol LectureListDetailDependency: Dependency {
}

public final class LectureListDetailComponent: Component<LectureListDetailDependency>, LectureListDetailFactory {
    @MainActor
    public func makeView(userID: String) -> some View {
        LectureListDetailView(
            viewModel: .init()
        )
    }
}
