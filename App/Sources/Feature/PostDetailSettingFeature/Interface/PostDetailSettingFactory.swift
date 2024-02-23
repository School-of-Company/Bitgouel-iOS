import SwiftUI

public protocol PostDetailSettingFactory {
    associatedtype SomeView: View
    func makeView(
        links: [String],
        completion: @escaping ([String]) -> Void
    ) -> SomeView
}
