import KakaoMapsSDK
import Service
import SwiftUI

@main
struct BitgouelApp: App {
    @StateObject private var sceneState = SceneState(sceneFlow: .login)
    @StateObject private var adminPageState = AdminPageState(adminPageFlow: .user)

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(sceneState)
                .environmentObject(adminPageState)
                .onAppear {
                    SDKInitializer
                        .InitSDK(appKey: Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as? String ?? "")
                }
        }
    }
}
