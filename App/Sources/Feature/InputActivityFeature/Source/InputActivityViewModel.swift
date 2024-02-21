import Foundation
import Service

final class InputActivityViewModel: BaseViewModel {
    @Published var activityTitle: String = ""
    @Published var activityText: String = ""
    @Published var isPresentedDetailSettingAppend: Bool = false
    @Published var activityDate = Date()
    @Published var activityCredit: Int = 0

    private let addStudentActivityUseCase: any AddStudentActivityUseCase

    init(addStudentActivityUseCase: any AddStudentActivityUseCase) {
        self.addStudentActivityUseCase = addStudentActivityUseCase
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
                try await addStudentActivityUseCase(
                    req: AddStudentActivityRequestDTO(
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
