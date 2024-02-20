import SwiftUI

public protocol ClubListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
