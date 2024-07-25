import NeedleFoundation
import SwiftUI

public protocol InputUniversityDependency: Dependency {}

public final class InputUniversityComponent: Component<InputUniversityDependency>, InputUniversityFactory {
    public func makeView(state: String) -> some View {
        InputUniversityView()
    }
}
