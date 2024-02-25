import Foundation

final class CertificationListViewModel: BaseViewModel {
    @Published var isPresentedAlterBottomSheet: Bool = false
    
    func isPresentedAlterBottomSheet(state: Bool) {
        isPresentedAlterBottomSheet = state
    }
}
