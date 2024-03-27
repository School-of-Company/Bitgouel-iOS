import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState
    private let loginFactory: any LoginFactory
    private let mainTabFactory: any MainTabFactory
    private let findPasswordFactory: any FindPasswordFactory

    public init(
        loginFactory: any LoginFactory,
        mainTabFactory: any MainTabFactory,
        findPasswordFactory: any FindPasswordFactory
    ) {
        self.loginFactory = loginFactory
        self.mainTabFactory = mainTabFactory
        self.findPasswordFactory = findPasswordFactory
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

            case .findPassword:
                findPasswordFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(sceneState)
            }
        }
        .animation(.default, value: sceneState.sceneFlow)
    }
}
