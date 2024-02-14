import NeedleFoundation
import Service
import SwiftUI

public protocol ClubListDependency: Dependency {}

public final class ClubListComponent: Component<ClubListDependency>, ClubListFactory {
    public func makeView() -> some View {
        ClubListView(
            viewModel: .init()
        )
    }
}
