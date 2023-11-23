import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState
    
    private let loginFactory: any LoginFactory
    
    public init(
        loginFactory: any LoginFactory
    ) {
        self.loginFactory = loginFactory
    }
    
    var body: some View {
        Group {
            switch appState.sceneFlow {
            case .login:
                loginFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(appState)
            }
        }
        .animation(.default, value: appState.sceneFlow)
    }
}
