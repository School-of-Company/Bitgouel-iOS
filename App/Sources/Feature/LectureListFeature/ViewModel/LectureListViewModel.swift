import Service
import SwiftUI

final class LectureListViewModel: BaseViewModel {
    @Published var selectedLectureType: String = ""
    @Published var selectedapproveStatusType: String = ""
    @Published var filteredLectureList: [LectureType] = []
    @Published var isNavigateLectureDetailDidTap = false
    @Published var lectureList: [LectureListEntity]?
    
    var model: LectureListModel
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let lectureListDetailFactory: any LectureListDetailFactory
    private let lectureListInquirtyUseCase: any LectureListInquirtyUseCase
    let lectureType: [LectureType] = LectureType.allCases
    let approveStatusType: [ApproveStatusType] = ApproveStatusType.allCases
    
    init(
        model: LectureListModel,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        lectureListDetailFactory: any LectureListDetailFactory,
        lectureListInquirtyUseCase: any LectureListInquirtyUseCase
    ) {
        self.model = model
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.lectureListDetailFactory = lectureListDetailFactory
        self.lectureListInquirtyUseCase = lectureListInquirtyUseCase
    }
    
    @MainActor
    func onAppear() {
        let authority = loadUserAuthorityUseCase()
        model.updateUserRole(authority: authority)
        
        Task {
            do {
                lectureList = try await lectureListInquirtyUseCase()
                model.updateContent(entity: lectureList ?? [])
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func lectureDidSelect(userID: String) {
        model.updateSelectedUserID(userID: userID)
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
