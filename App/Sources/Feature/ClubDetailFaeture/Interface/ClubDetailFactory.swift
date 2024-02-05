import SwiftUI

public protocol ClubDetailFactory {
    associatedtype SomeView: View
    func makeView(clubId: String) -> SomeView
}
