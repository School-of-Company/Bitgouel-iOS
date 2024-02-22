import SwiftUI
import Service

final class LectureListDetailViewModel: BaseViewModel {
    @Published var lectureDetail: LectureDetailEntity?
    @Published var isSuccessEnrolment = false
    @Published var isEnrolment = false
    
    private let userID: String
    private let queryLectureDetailUseCase: any QueryLectureDetailUseCase
    
    init(
        userID: String,
        queryLectureDetailUseCase: any QueryLectureDetailUseCase
    ) {
        self.userID = userID
        self.queryLectureDetailUseCase = queryLectureDetailUseCase
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
}
