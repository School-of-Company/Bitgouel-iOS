import NeedleFoundation
import Service
import SwiftUI

public protocol LectureListDependency: Dependency {
    var lectureListDetailFactory: any LectureListDetailFactory { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var queryLectureListUseCase: any QueryLectureListUseCase { get }
}

public final class LectureListComponent: Component<LectureListDependency>, LectureListFactory {
    @MainActor
    public func makeView() -> some View {
        let model = LectureListModel()
        return LectureListView(
            lectureListDetailFactory: dependency.lectureListDetailFactory,
            model: model,
            viewModel: .init(
                model: model, 
                loadUserAuthorityUseCase: self.dependency.loadUserAuthorityUseCase,
                lectureListDetailFactory: self.dependency.lectureListDetailFactory,
                queryLectureListUseCase: self.dependency.queryLectureListUseCase
            )
        )
    }
}
