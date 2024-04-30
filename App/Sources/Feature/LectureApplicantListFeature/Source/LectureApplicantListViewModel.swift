import Foundation
import Service

final class LectureApplicantListViewModel: BaseViewModel {
    @Published var applicantList: [ApplicantInfoEntity] = []
    @Published var selectedStudentID: String = ""
    var lectureID: String = ""

    private let fetchApplicantListUseCase: any FetchApplicantListUseCase
    
    init(
        lectureID: String,
        fetchApplicantListUseCase: any FetchApplicantListUseCase
    ) {
        self.lectureID = lectureID
        self.fetchApplicantListUseCase = fetchApplicantListUseCase
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                applicantList = try await fetchApplicantListUseCase(lectureID: lectureID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
