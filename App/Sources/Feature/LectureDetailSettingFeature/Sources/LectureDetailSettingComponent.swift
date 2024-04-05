import NeedleFoundation
import Service
import SwiftUI

public protocol LectureDetailSettingDependency: Dependency {
    var openLectureApplyFactory: any OpenLectureApplyFactory { get }
    var fetchInstructorListUseCase: any FetchInstructorListUseCase { get }
    var fetchLineListUseCase: any FetchLineListUseCase { get }
    var fetchDepartmentListUseCase: any FetchDepartmentListUseCase { get }
}

public final class LectureDetailSettingComponent: Component<LectureDetailSettingDependency>,
    LectureDetailSettingFactory {
    public func makeView(
        detailInfo: OpenLectureModel,
        completion: @escaping (OpenLectureModel) -> Void
    ) -> some View {
        LectureDetailSettingView(
            viewModel: .init(
                detailInfo: detailInfo,
                completion: completion,
                fetchInstructorListUseCase: dependency.fetchInstructorListUseCase,
                fetchLineListUseCase: dependency.fetchLineListUseCase,
                fetchDepartmentListUseCase: dependency.fetchDepartmentListUseCase
            ),
            openLectureApplyFactory: dependency.openLectureApplyFactory
        )
    }
}
