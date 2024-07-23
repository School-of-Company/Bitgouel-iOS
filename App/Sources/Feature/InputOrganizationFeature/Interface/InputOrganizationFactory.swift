import SwiftUI

public protocol InputOrganizationFactory {
    associatedtype SomeView: View
    func makeView(type: OrganizationType) -> SomeView
}
