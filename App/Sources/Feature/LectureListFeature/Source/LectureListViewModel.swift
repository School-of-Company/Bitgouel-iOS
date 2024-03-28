import Service
import SwiftUI

final class LectureListViewModel: BaseViewModel {
    @Published var selectedLectureType: String = ""
    @Published var filteredLectureList: [LectureType] = []
    @Published var isNavigateLectureDetailDidTap = false
    @Published var authority: UserAuthorityType = .user
    @Published var lectureList: LectureContentEntity?
    @Published var selectedLectureID: String?
    @Published var isPresentedLectureDetailView: Bool = false
    @Published var type: LectureType?
    @Published var isShowingLoginAlert: Bool = false

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let lectureListDetailFactory: any LectureListDetailFactory
    private let fetchLectureListUseCase: any FetchLectureListUseCase
    let lectureType: [LectureType] = LectureType.allCases
    let approveStatusType: [ApproveStatusType] = ApproveStatusType.allCases
    
    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        lectureListDetailFactory: any LectureListDetailFactory,
        fetchLectureListUseCase: any FetchLectureListUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.lectureListDetailFactory = lectureListDetailFactory
        self.fetchLectureListUseCase = fetchLectureListUseCase
    }

    func updateType(lectureType: String) {
        switch lectureType {
        case "상호학점인정교육과정": 
            return type = .mutualCreditRecognitionProgram
        case "대학탐방프로그램":
            return type = .universityExplorationProgram
        default:
            return type = nil
        }
    }

    func updateContent(entity: LectureContentEntity) {
        self.lectureList = entity
    }
    
    func updateSelectedLectureID(lectureID: String) {
        self.selectedLectureID = lectureID
    }

    @MainActor
    func isShowingLoginAlertDismissed() {
        isShowingLoginAlert = false
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        
        Task {
            do {
                let response = try await fetchLectureListUseCase(type: type?.rawValue ?? "")
                updateContent(entity: response)
            } catch {
                print(String(describing: error))
            }
        }
    }

    func updateIsPresentedLectureDetailView(isPresented: Bool) {
        isPresentedLectureDetailView = isPresented
    }

    func filteredLectureType(_ filterType: LectureType) {
        filteredLectureList = lectureType.filter { lecture in
            return lecture.display() == selectedLectureType
        }
    }
}
