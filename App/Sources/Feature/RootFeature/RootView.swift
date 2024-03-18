import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState
    private let loginFactory: any LoginFactory
    private let mainTabFactory: any MainTabFactory
    private let adminUserListFactory: any AdminUserListFactory

    public init(
        loginFactory: any LoginFactory,
        mainTabFactory: any MainTabFactory,
        adminUserListFactory: any AdminUserListFactory
    ) {
        self.loginFactory = loginFactory
        self.mainTabFactory = mainTabFactory
        self.adminUserListFactory = adminUserListFactory
    }

    var body: some View {
        Group {
            switch sceneState.sceneFlow {
            case .login:
                loginFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(sceneState)
                
            case .main:
                mainTabFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(sceneState)
                
            case .admin:
                adminUserListFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(sceneState)
            }
        }
        .animation(.default, value: sceneState.sceneFlow)
    }
}
