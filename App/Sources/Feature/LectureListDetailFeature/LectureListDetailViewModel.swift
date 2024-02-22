import SwiftUI
import Service

final class LectureListDetailViewModel: BaseViewModel {
    @Published var lectureDetail: LectureDetailEntity?
    @Published var isSuccessEnrolment = false
    @Published var isEnrolment = false
    
    private let userID: String
    private let queryLectureDetailUseCase: any QueryLectureDetailUseCase
    private let lectureApplyUseCase: any LectureApplyUseCase
    
    init(
        userID: String,
        queryLectureDetailUseCase: any QueryLectureDetailUseCase,
        lectureApplyUseCase: any LectureApplyUseCase
    ) {
        self.userID = userID
        self.queryLectureDetailUseCase = queryLectureDetailUseCase
        self.lectureApplyUseCase = lectureApplyUseCase
    }

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
    
    func onAppear() {
        Task {
            do {
                lectureDetail = try await queryLectureDetailUseCase(userID: userID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func applyLecture() {
        Task {
            do {
                try await lectureApplyUseCase(userID: userID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
