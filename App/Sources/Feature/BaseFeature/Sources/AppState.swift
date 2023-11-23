import Foundation

public final class AppState: ObservableObject {
    @Published public var sceneFlow: SceneFlow
    
    public init(sceneFlow: SceneFlow) {
        self.sceneFlow = sceneFlow
    }
}
