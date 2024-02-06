import NeedleFoundation
import Service
import SwiftUI

public protocol ActivityDetailSettingDependency: Dependency {}

public final class ActivityDetailSettingComponent: Component<ActivityDetailSettingDependency>,
    ActivityDetailSettingFactory {
    public func makeView(
        activityDate: String,
        activityCredit: Int,
        completion: @escaping (String, Int) -> Void
    ) -> some View {
        ActivityDetailSettingView(
            viewModel: .init(
                activityDate: activityDate,
                activityCredit: activityCredit,
                completion: completion
            )
        )
    }
}
