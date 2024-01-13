import Service
import SwiftUI

final class ActivityDetailSettingViewModel: BaseViewModel {
    @State var activityDate = Date()
    @State private var isCredit: Bool = false
    @Published var isPresentedCreditSheet: Bool = false
    @Published var selectedCredit: Int?
    
    let creditValue: [Int] = [1, 2]
}
