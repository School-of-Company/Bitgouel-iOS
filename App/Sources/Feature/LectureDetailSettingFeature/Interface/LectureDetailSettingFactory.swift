import SwiftUI

public protocol LectureDetailSettingFactory {
    associatedtype SomeView: View
    func makeView(
        detailInfo: OpenLectureModel,
        completion: @escaping (OpenLectureModel) -> Void
    ) -> SomeView
}
