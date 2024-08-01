import SwiftUI

public protocol InputClubFactory {
    associatedtype SomeView: View
    func makeView(
        schoolID: Int,
        state: String,
        clubInfo: ClubDetailModel
    ) -> SomeView
}
