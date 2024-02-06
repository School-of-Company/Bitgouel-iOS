import Foundation
import Service

final class InputActivityViewModel: BaseViewModel {
    @Published var title: String = ""
    @Published var activityText: String = ""
    @Published var isPresentedDetailSettingAppend: Bool = false
    @Published var activityDate: String = ""
    @Published var activityCredit: Int = 0

    private let addStudentActivityUseCase: any AddStudentActivityUseCase

    init(addStudentActivityUseCase: any AddStudentActivityUseCase) {
        self.addStudentActivityUseCase = addStudentActivityUseCase
    }

    func detailSettingAppendDismissed() {
        self.isPresentedDetailSettingAppend = false
    }

    func updateActivityDetail(date: String, credit: Int) {
        self.activityDate = date
        self.activityCredit = credit
    }

    func addActivity() {
        Task {
            do {
                try await addStudentActivityUseCase(
                    req: AddStudentActivityRequestDTO(
                        title: title,
                        content: activityText,
                        credit: activityCredit,
                        activityDate: activityDate
                    )
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
