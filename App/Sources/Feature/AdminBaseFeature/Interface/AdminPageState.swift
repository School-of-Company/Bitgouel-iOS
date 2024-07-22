import Foundation

public final class AdminPageState: ObservableObject {
    @Published public var adminPageFlow: AdminPageFlow

    init(adminPageFlow: AdminPageFlow) {
        self.adminPageFlow = adminPageFlow
    }
}
