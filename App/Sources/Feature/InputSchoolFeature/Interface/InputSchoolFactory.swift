import SwiftUI

public protocol InputSchoolFactory {
    associatedtype SomeView: View
    func makeView(
        schoolID: Int,
        schoolInfo: SchoolDetailInfoModel
    ) -> SomeView
}
