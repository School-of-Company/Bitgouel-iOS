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
    private let lectureCancelUseCase: any LectureCancelUseCase
    
    init(
        userID: String,
        queryLectureDetailUseCase: any QueryLectureDetailUseCase,
        lectureApplyUseCase: any LectureApplyUseCase,
        lectureCancelUseCase: any LectureCancelUseCase
    ) {
        self.userID = userID
        self.queryLectureDetailUseCase = queryLectureDetailUseCase
        self.lectureApplyUseCase = lectureApplyUseCase
        self.lectureCancelUseCase = lectureCancelUseCase
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
                try await lectureCancelUseCase(userID: userID)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
