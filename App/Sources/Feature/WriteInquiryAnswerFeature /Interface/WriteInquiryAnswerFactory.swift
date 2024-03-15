import SwiftUI

public protocol WriteInquiryAnswerFactory {
    associatedtype SomeView: View
    func makeView(inquiryID: String) -> SomeView
}
