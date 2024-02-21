import Service
import SwiftUI

final class ActivityDetailSettingViewModel: BaseViewModel {
    @Published var selectedDate: Date
    @State private var isCredit: Bool = false
    @Published var isPresentedCreditSheet: Bool = false
    @Published var selectedCredit: Int?

    let creditValue: [Int] = [1, 2]
    private let completion: (Date, Int) -> Void

    init(
        activityDate: Date,
        activityCredit: Int,
        completion: @escaping (Date, Int) -> Void
    ) {
        self.selectedDate = activityDate
        self.selectedCredit = activityCredit
        self.completion = completion
    }

    func updateDate(date: Date) {
        self.selectedDate = date
    }

    func applyButtonDidTap() {
        completion(selectedDate, selectedCredit ?? 0)
    }
}
