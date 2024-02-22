import SwiftUI
import Service

final class LectureListDetailViewModel: BaseViewModel {
    @Published var lectureDetail: LectureDetailEntity?
    @Published var isSuccessEnrolment = false
    @Published var isApply = false
    @Published var isCancel = false
    
    private let userID: String
    private let queryLectureDetailUseCase: any QueryLectureDetailUseCase
    private let lectureApplyUseCase: any LectureApplyUseCase
    private let lectureCancleUseCase: any LectureCancleUseCase
    
    init(
        userID: String,
        queryLectureDetailUseCase: any QueryLectureDetailUseCase,
        lectureApplyUseCase: any LectureApplyUseCase,
        lectureCancleUseCase: any LectureCancleUseCase
    ) {
        self.userID = userID
        self.queryLectureDetailUseCase = queryLectureDetailUseCase
        self.lectureApplyUseCase = lectureApplyUseCase
        self.lectureCancleUseCase = lectureCancleUseCase
    }
    
    var statusText: String {
        if lectureDetail?.isRegistered ?? true {
            return "수강 신청하기"
        } else {
            return "수강 신청 완료"
        }
    }

    var isEnabledEnrolment: Bool {
        if isApply {
            return true
        } else {
            return false
        }
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
    
    func cancelLecture() {
        Task {
            do {
                try await lectureCancleUseCase(userID: userID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
