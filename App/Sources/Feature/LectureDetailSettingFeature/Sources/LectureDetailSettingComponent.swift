import NeedleFoundation
import Service
import SwiftUI

public protocol LectureDetailSettingDependency: Dependency {
    var inputLectureFactory: any InputLectureFactory { get }
    var searchInstructorUseCase: any SearchInstructorUseCase { get }
    var searchLineUseCase: any SearchLineUseCase { get }
    var searchDepartmentUseCase: any SearchDepartmentUseCase { get }
    var searchDivisionUseCase: any SearchDivisionUseCase { get }
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
                searchInstructorUseCase: dependency.searchInstructorUseCase,
                searchLineUseCase: dependency.searchLineUseCase,
                searchDepartmentUseCase: dependency.searchDepartmentUseCase,
                searchDivisionUseCase: dependency.searchDivisionUseCase
            ),
            inputLectureFactory: dependency.inputLectureFactory
        )
    }
}
