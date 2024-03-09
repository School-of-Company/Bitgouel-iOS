import SwiftUI

public protocol InputInquiryFactory {
    associatedtype SomeView: View
    func makeView(
        state: String,
        InquiryID: String
    ) -> SomeView
}
