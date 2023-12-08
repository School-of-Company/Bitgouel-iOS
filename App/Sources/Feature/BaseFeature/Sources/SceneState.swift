import Foundation

public final class SceneState: ObservableObject {
    @Published public var sceneFlow: SceneFlow

    init(sceneFlow: SceneFlow) {
        self.sceneFlow = sceneFlow
    }
}
