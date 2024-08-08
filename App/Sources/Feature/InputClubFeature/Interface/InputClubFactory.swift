import SwiftUI
import Service

public protocol InputClubFactory {
    associatedtype SomeView: View
    func makeView(
        schoolID: Int,
        state: String,
        clubInfo: SchoolWithClubsEntity
    ) -> SomeView
}
