import SwiftUI

public protocol ActivityDetailSettingFactory {
    associatedtype SomeView: View
    func makeView(
        activityDate: Date,
        activityCredit: Int,
        completion: @escaping (Date, Int) -> Void
    ) -> SomeView
}
