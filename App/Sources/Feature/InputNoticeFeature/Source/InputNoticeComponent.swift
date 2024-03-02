import NeedleFoundation
import SwiftUI
import Service

public protocol InputNoticeDependency: Dependency {
    
}

public final class InputNoticeComponent: Component<InputNoticeDependency>, InputNoticeFactory {
    public func makeView(epic: String) -> some View {
        InputNoticeView()
    }
}
