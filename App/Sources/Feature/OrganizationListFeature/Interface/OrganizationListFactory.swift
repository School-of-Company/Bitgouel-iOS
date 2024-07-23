import SwiftUI

public enum OrganizationType: String {
    case company = "기업"
    case government = "유관기관"
}

public protocol OrganizationListFactory {
    associatedtype SomeView: View
    func makeView(type: OrganizationType) -> SomeView
}
