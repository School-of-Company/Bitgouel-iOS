import Service
import SwiftUI
import KakaoMapsSDK

@main
struct BitgouelApp: App {
    @StateObject private var sceneState = SceneState(sceneFlow: .login)
    @StateObject private var adminPageState = AdminPageState(adminPageFlow: .user)

    init() {
        registerProviderFactories()
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") else {
            print("API 키 로드 실패!!")
            return
        }

        SDKInitializer.InitSDK(appKey: apiKey as? String ?? "")
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(sceneState)
                .environmentObject(adminPageState)
        }
    }
}
