import SwiftUI

public protocol OrganizationListFactory {
    associatedtype SomeView: View
    func makeView(type: OrganizationType, selectedPage: AdminPageFlow) -> SomeView
}
