import NeedleFoundation
import Service
import SwiftUI

public protocol LectureDetailSettingDependency: Dependency {
    var inputLectureFactory: any InputLectureFactory { get }
    var fetchInstructorListUseCase: any FetchInstructorListUseCase { get }
    var fetchLineListUseCase: any FetchLineListUseCase { get }
    var fetchDepartmentListUseCase: any FetchDepartmentListUseCase { get }
    var fetchDivisionListUseCase: any FetchDivisionListUseCase { get }
}

public final class LectureDetailSettingComponent: Component<LectureDetailSettingDependency>,
    LectureDetailSettingFactory {
    public func makeView(
        detailInfo: LectureDataModel,
        completion: @escaping (LectureDataModel) -> Void
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
            inputLectureFactory: dependency.inputLectureFactory
        )
    }
}
