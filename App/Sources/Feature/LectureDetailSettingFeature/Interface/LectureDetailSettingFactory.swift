import SwiftUI

public protocol LectureDetailSettingFactory {
    associatedtype SomeView: View
    func makeView(
        detailInfo: LectureDataModel,
        completion: @escaping (LectureDataModel) -> Void
    ) -> SomeView
}
