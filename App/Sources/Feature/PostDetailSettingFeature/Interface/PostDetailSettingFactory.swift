import SwiftUI

public protocol PostDetailSettingFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
