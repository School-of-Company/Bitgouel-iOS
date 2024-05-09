import NeedleFoundation
import Service
import SwiftUI

public protocol LectureListDependency: Dependency {
    var lectureListDetailFactory: any LectureListDetailFactory { get }
    var openedLectureFactory: any OpenedLectureFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchLectureListUseCase: any FetchLectureListUseCase { get }
}

public final class LectureListComponent: Component<LectureListDependency>, LectureListFactory {
    @MainActor
    public func makeView(selection: Binding<TabFlow>) -> some View {
        return LectureListView(
            lectureListDetailFactory: dependency.lectureListDetailFactory,
            openedLectureFactory: dependency.openedLectureFactory,
            viewModel: .init(
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                lectureListDetailFactory: self.dependency.lectureListDetailFactory,
                fetchLectureListUseCase: self.dependency.fetchLectureListUseCase
            ),
            selection: selection
        )
    }
}
