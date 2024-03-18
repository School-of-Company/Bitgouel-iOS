import NeedleFoundation
import SwiftUI
import Service

public protocol MyPageDependency: Dependency {
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var fetchMyInfoUseCase: any FetchMyInfoUseCase { get }
    var logoutUseCase: any LogoutUseCase { get }
    var withdrawalUseCase: any WithdrawalUseCase { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageFactory {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.loadUserAuthorityUseCase,
                fetchMyInfoUseCase: dependency.fetchMyInfoUseCase,
                logoutUseCase: dependency.logoutUseCase,
                withdrawalUseCase: dependency.withdrawalUseCase
            )
        )
    }
}
