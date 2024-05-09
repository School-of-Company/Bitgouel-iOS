import SwiftUI

public protocol LectureDetailSettingFactory {
    associatedtype SomeView: View
    func makeView(
        detailInfo: OpenedLectureModel,
        completion: @escaping (OpenedLectureModel) -> Void
    ) -> SomeView
}
