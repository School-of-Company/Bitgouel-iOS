import SwiftUI

public protocol ClubDetailFactory {
    associatedtype SomeView: View
    func makeView(clubID: String) -> SomeView
}
