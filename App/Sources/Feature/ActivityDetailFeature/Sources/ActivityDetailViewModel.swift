import Service
import SwiftUI

final class ActivityDetailViewModel: BaseViewModel {
    @State var activityDate = Date()
    @State private var isCredit: Bool = false
    @Published var isPresentedCreditSheet: Bool = false
    @Published var credit: Int?
    let creditValue: [Int] = [1, 2]
}
