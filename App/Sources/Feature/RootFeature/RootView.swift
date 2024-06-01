import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState
    private let loginFactory: any LoginFactory
    private let mainTabFactory: any MainTabFactory
    private let findPasswordFactory: any FindPasswordFactory
    private let successSignUpFactory: any SuccessSignUpFactory

    public init(
        loginFactory: any LoginFactory,
        mainTabFactory: any MainTabFactory,
        findPasswordFactory: any FindPasswordFactory,
        successSignUpFactory: any SuccessSignUpFactory
    ) {
        self.loginFactory = loginFactory
        self.mainTabFactory = mainTabFactory
        self.findPasswordFactory = findPasswordFactory
        self.successSignUpFactory = successSignUpFactory
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

            case .signup:
                successSignUpFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(sceneState)
            }
        }
        .animation(.default, value: sceneState.sceneFlow)
    }
}
