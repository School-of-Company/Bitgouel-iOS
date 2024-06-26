import NeedleFoundation
import Service
import SwiftUI

public protocol LectureDetailSettingDependency: Dependency {
    var openedLectureFactory: any OpenedLectureFactory { get }
    var fetchInstructorListUseCase: any FetchInstructorListUseCase { get }
    var fetchLineListUseCase: any FetchLineListUseCase { get }
    var fetchDepartmentListUseCase: any FetchDepartmentListUseCase { get }
    var fetchDivisionListUseCase: any FetchDivisionListUseCase { get }
}

public final class LectureDetailSettingComponent: Component<LectureDetailSettingDependency>,
    LectureDetailSettingFactory {
    public func makeView(
        detailInfo: OpenedLectureModel,
        completion: @escaping (OpenedLectureModel) -> Void
    ) -> some View {
        LectureDetailSettingView(
            viewModel: .init(
                detailInfo: detailInfo,
                completion: completion,
                fetchInstructorListUseCase: dependency.fetchInstructorListUseCase,
                fetchLineListUseCase: dependency.fetchLineListUseCase,
                fetchDepartmentListUseCase: dependency.fetchDepartmentListUseCase,
                fetchDivisionListUseCase: dependency.fetchDivisionListUseCase
            ),
            openedLectureFactory: dependency.openedLectureFactory
        )
    }
}
