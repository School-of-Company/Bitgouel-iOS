import NeedleFoundation
import Service
import SwiftUI

public protocol InputLectureDependency: Dependency {
    var openLectureUseCase: any OpenLectureUseCase { get }
    var lectureDetailSettingFactory: any LectureDetailSettingFactory { get }
    var fetchLectureDetailUseCase: any FetchLectureDetailUseCase { get }
    var modifyLectureUseCase: any ModifyLectureUseCase { get }
}

public final class InputLectureComponent: Component<InputLectureDependency>, InputLectureFactory {
    public func makeView(
        state: String,
        lectureID: String
    ) -> some View {
        InputLectureView(
            viewModel: .init(
                openLectureUseCase: dependency.openLectureUseCase,
                lectureID: lectureID,
                state: state,
                fetchLectureDetailUseCase: dependency.fetchLectureDetailUseCase,
                modifyLectureUseCase: dependency.modifyLectureUseCase
            ),
            lectureDetailSettingFactory: dependency.lectureDetailSettingFactory
        )
    }
}
