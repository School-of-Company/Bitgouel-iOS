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

    private let fetchActivityDetailUseCase: any FetchActivityDetailUseCase
    private let inputActivityUseCase: any InputActivityUseCase

    init(
        state: String,
        activityID: String,
        fetchActivityDetailUseCase: any FetchActivityDetailUseCase,
        inputActivityUseCase: any InputActivityUseCase
    ) {
        self.state = state
        self.activityID = activityID
        self.fetchActivityDetailUseCase = fetchActivityDetailUseCase
        self.inputActivityUseCase = inputActivityUseCase
    }

    func detailSettingAppendDismissed() {
        self.isPresentedDetailSettingAppend = false
    }

    func updateActivityDetail(date: Date, credit: Int) {
        self.activityDate = date
        self.activityCredit = credit
    }

    func updateActivityDetail(entity: ActivityDetailEntity) {
        activityTitle = entity.title
        activityText = entity.content
        activityCredit = entity.credit
        activityDate = entity.activityDate.toDateCustomFormat(format: "yyyy-MM-dd")
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                let response = try await fetchActivityDetailUseCase(activityID: activityID)
                
                updateActivityDetail(entity: response)
            } catch {
                print(error.localizedDescription)
            }
        }
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
