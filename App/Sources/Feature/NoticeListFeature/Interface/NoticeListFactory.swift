import SwiftUI

public protocol NoticeListFactory {
    associatedtype SomeView: View
    func makeview() -> SomeView
}
