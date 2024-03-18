import Service
import SwiftUI

final class LectureListViewModel: BaseViewModel {
    @Published var selectedLectureType: String = ""
    @Published var filteredLectureList: [LectureType] = []
    @Published var isNavigateLectureDetailDidTap = false
    
    var model: LectureListModel
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let lectureListDetailFactory: any LectureListDetailFactory
    private let fetchLectureListUseCase: any FetchLectureListUseCase
    let lectureType: [LectureType] = LectureType.allCases
    let approveStatusType: [ApproveStatusType] = ApproveStatusType.allCases
    
    init(
        model: LectureListModel,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        lectureListDetailFactory: any LectureListDetailFactory,
        fetchLectureListUseCase: any FetchLectureListUseCase
    ) {
        self.model = model
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.lectureListDetailFactory = lectureListDetailFactory
        self.fetchLectureListUseCase = fetchLectureListUseCase
    }
    
    @MainActor
    func onAppear() {
        let authority = loadUserAuthorityUseCase()
        model.updateUserRole(authority: authority)
        
        Task {
            do {
                let response = try await fetchLectureListUseCase(type: selectedLectureType)
                model.updateContent(entity: response)
            } catch {
                print(String(describing: error))
            }
        }
    }
    
    @MainActor
    func lectureDidSelect(lectureID: String) {
        model.updateSelectedLectureID(lectureID: lectureID)
    }
    
    @MainActor
    func lectureDetailPageDismissed() {
        model.isPresentedLectureDetailPage = false
    }

    func filteredLectureType(_ filterType: LectureType) {
        filteredLectureList = lectureType.filter { lecture in
            return lecture.display() == selectedLectureType
        }
    }
}
