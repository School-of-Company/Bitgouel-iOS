import SwiftUI

struct RootView: View {
    @EnvironmentObject var sceneState: SceneState
    private let loginFactory: any LoginFactory
    private let activityListFactory: any ActivityListFactory

    public init(
        loginFactory: any LoginFactory,
        activityListFactory: any ActivityListFactory
    ) {
        self.loginFactory = loginFactory
        self.activityListFactory = activityListFactory
    }

    var body: some View {
        Group {
            switch sceneState.sceneFlow {
            case .login:
                loginFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(sceneState)
            case .Activity:
                activityListFactory.makeView(studentID: .init())
                    .eraseToAnyView()
                    .environmentObject(sceneState)
            }
        }
        .animation(.default, value: sceneState.sceneFlow)
    }
}
