import SwiftUI

public protocol ActivityDetailSettingFactory {
    associatedtype SomeView: View
    func makeView(
        activityDate: String,
        activityCredit: Int,
        completion: @escaping (String, Int) -> Void
    ) -> SomeView
}
