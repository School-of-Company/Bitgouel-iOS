import Foundation
import Service

final class InputActivityViewModel: BaseViewModel {
    @Published var activityTitle: String = ""
    @Published var activityText: String = ""
    @Published var isPresentedDetailSettingAppend: Bool = false
    @Published var activityDate = Date()
    @Published var activityCredit: Int = 0

    var state: String = ""
    var activityID: String = ""
    
    private let inputActivityUseCase: any InputActivityUseCase

    init(
        state: String,
        activityID: String,
        inputActivityUseCase: any InputActivityUseCase
    ) {
        self.state = state
        self.activityID = activityID
        self.inputActivityUseCase = inputActivityUseCase
    }

    func detailSettingAppendDismissed() {
        self.isPresentedDetailSettingAppend = false
    }

    func updateActivityDetail(date: Date, credit: Int) {
        self.activityDate = date
        print("\(activityDate)")
        self.activityCredit = credit
    }

    func addActivity() {
        Task {
            do {
                try await inputActivityUseCase(
                    req: InputActivityRequestDTO(
                        title: activityTitle,
                        content: activityText,
                        credit: activityCredit,
                        activityDate: activityDate.toStringCustomFormat(format: "yyyy-MM-dd")
                    )
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
