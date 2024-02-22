import NeedleFoundation
import SwiftUI
import Service

public protocol InputPostDependency: Dependency {
    
}

public final class InputPostComponent: Component<InputPostDependency>, InputPostFactory {
    public func makeView() -> some View {
        InputPostView()
    }
}
