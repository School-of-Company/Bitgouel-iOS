import SwiftUI

public protocol InquiryListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
