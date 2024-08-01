import NeedleFoundation
import SwiftUI

public protocol InputClubDependency: Dependency {}

public final class InputClubComponent: Component<InputClubDependency>, InputClubFactory {
    public func makeView(schoolID: Int, state: String, clubInfo: ClubDetailModel) -> some View {
        InputClubView()
    }
}
