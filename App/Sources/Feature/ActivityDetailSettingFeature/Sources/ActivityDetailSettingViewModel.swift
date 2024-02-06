import Service
import SwiftUI

final class ActivityDetailSettingViewModel: BaseViewModel {
    @Published var date = Date()
    @State private var isCredit: Bool = false
    @Published var isPresentedCreditSheet: Bool = false
    @Published var selectedCredit: Int?
    @Published var selectedDate: String = ""

    let creditValue: [Int] = [1, 2]
    private let completion: (String, Int) -> Void

    init(
        activityDate: String,
        activityCredit: Int,
        completion: @escaping (String, Int) -> Void
    ) {
        self.selectedDate = activityDate
        self.selectedCredit = activityCredit
        self.completion = completion
    }

    func updateDate(date: Date) {
        self.date = date
        self.selectedDate = date.description
    }

    func applyButtonDidTap() {
        completion(selectedDate, selectedCredit ?? 0)
    }
}
