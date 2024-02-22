import SwiftUI

final class LectureListDetailViewModel: ObservableObject {
    @Published var isApprove = false
    @Published var isSuccessEnrolment = false
    @Published var isEnrolment = false
    @AppStorage("admin") var isAdmin = false

    var enrolmentButtonText: String {
        if isSuccessEnrolment {
            return "수강 신청 완료"
        } else {
            return "수강 신청하기"
        }
    }

    var isEnabledEnrolment: Bool {
        if isEnrolment {
            return true
        } else {
            return false
        }
    }

    func enrollmentButtonDidTap() {
        isEnrolment = true
    }
}
