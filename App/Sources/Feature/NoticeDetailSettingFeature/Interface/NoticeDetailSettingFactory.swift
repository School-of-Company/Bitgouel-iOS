import Service
import SwiftUI

public protocol NoticeDetailSettingFactory {
    associatedtype SomeView: View
    func makeView(
        noticeLinks: [String],
        completion: @escaping ([String]) -> Void
    ) -> SomeView
}
