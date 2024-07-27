import SwiftUI

public protocol InputUniversityFactory {
    associatedtype SomeView: View
    func makeView(
        state: String,
        universityName: String,
        departmentList: [String],
        universityID: Int
    ) -> SomeView
}
