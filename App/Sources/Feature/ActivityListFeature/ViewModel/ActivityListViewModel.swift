import Foundation
import Service

final class ActivityListViewModel: BaseViewModel {
    @Published var model: ActivityListModel
    private let queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase
    private let queryStudentActivityListUseCase: any QueryStudentActivityListUseCase
    private let queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase

    init(
        model: ActivityListModel,
        queryMyStudentActivityUseCase: any QueryMyStudentActivityUseCase,
        queryStudentActivityListUseCase: any QueryStudentActivityListUseCase,
        queryStudentActivityByIdUseCase: any QueryStudentActivityByIdUseCase
    ) {
        self.model = model
        self.queryMyStudentActivityUseCase = queryMyStudentActivityUseCase
        self.queryStudentActivityListUseCase = queryStudentActivityListUseCase
        self.queryStudentActivityByIdUseCase = queryStudentActivityByIdUseCase
    }
}
