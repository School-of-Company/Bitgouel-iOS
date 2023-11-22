import SwiftUI
import Service

final class LectureListViewModel: ObservableObject {
    @Published var selectedLectureType: String = ""
    @Published var selectedapproveStatusType: String = ""
    @Published var filteredLectureList: [LectureType] = []
    @Published var isAdmin = false
    @Published var approveApplication = false
    @Published var rejectedApplication = false
    @Published var isNavigateLectureDetailDidTap = false
    @Published var approveLecture = false
    @Published var rejectLecture = false
    @Published var isEnrolment = false
    @Published var isApprove = false
    @Published var isSuccessEnrolment = false
    let lectureType: [LectureType] = LectureType.allCases
    let approveStatusType: [ApproveStatusType] = ApproveStatusType.allCases
    
    var isEnabledApplicationButton: Bool {
        if approveApplication || rejectedApplication {
            return true
        } else {
            return false
        }
    }
    
    var isEnabledEnrolment: Bool {
        if isEnrolment {
            return true
        } else {
            return false
        }
    }
    
    var enrolmentButtonText: String {
        if isSuccessEnrolment {
            return "수강 신청 완료"
        } else {
            return "수강 신청하기"
        }
    }
    
    func filteredLectureType(_ filterType: LectureType) {
        filteredLectureList = lectureType.filter { lecture in
            return lecture.display() == selectedLectureType
        }
    }
    
    func rejectedApplicationDidTap() {
        rejectedApplication = true
    }
    
    func approveApplicationDidTap() {
        approveApplication = true
    }
    
    func enrolmentButtonDidTap() {
        isEnrolment = true
    }
    
    func isApproveDidTap() {
        isApprove = true
    }
}
