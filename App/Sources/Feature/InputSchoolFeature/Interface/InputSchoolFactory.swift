import SwiftUI

public protocol InputSchoolFactory {
    associatedtype SomeView: View
    func makeView(
        state: String,
        schoolInfo: SchoolDetailInfoModel
    ) -> SomeView
}
