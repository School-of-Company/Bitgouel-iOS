import SwiftUI

public protocol InquiryDetailFactory {
    associatedtype SomeView: View
    func makeView(inquiryID: String) -> SomeView
}
