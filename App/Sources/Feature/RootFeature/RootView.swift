import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState
    private let loginFactory: any LoginFactory
    private let mainTabFactory: any MainTabFactory

    public init(
        loginFactory: any LoginFactory,
        mainTabFactory: any MainTabFactory
    ) {
        self.loginFactory = loginFactory
        self.mainTabFactory = mainTabFactory
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
            }
        }
        .animation(.default, value: sceneState.sceneFlow)
    }
}
