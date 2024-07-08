import Service
import SwiftUI

final class LectureListDetailViewModel: BaseViewModel {
    @Published var lectureDetail: LectureDetailEntity?
    @Published var isSuccessEnrolment: Bool = false
    @Published var isApply: Bool = false
    @Published var isCancel: Bool = false
    @Published var isPresentedLectureApplicantListView: Bool = false
    @Published var userAuthority: UserAuthorityType = .user
    @Published var isPresentedLectureActionSheet: Bool = false
    @Published var isPresentedInputLectureView: Bool = false

    let lectureID: String
    private let fetchLectureDetailUseCase: any FetchLectureDetailUseCase
    private let applyLectureUseCase: any ApplyLectureUseCase
    private let cancelLectureUseCase: any CancelLectureUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let deleteLectureUseCase: any DeleteLectureUseCase

    init(
        lectureID: String,
        fetchLectureDetailUseCase: any FetchLectureDetailUseCase,
        applyLectureUseCase: any ApplyLectureUseCase,
        cancelLectureUseCase: any CancelLectureUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        deleteLectureUseCase: any DeleteLectureUseCase
    ) {
        self.lectureID = lectureID
        self.fetchLectureDetailUseCase = fetchLectureDetailUseCase
        self.applyLectureUseCase = applyLectureUseCase
        self.cancelLectureUseCase = cancelLectureUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.deleteLectureUseCase = deleteLectureUseCase
    }

    func updateIsPresentedLectureApplicantView(isPresented: Bool) {
        isPresentedLectureApplicantListView = isPresented
    }

    func updateIsPresentedLectureActionSheet(isPresented: Bool) {
        isPresentedLectureActionSheet = isPresented
    }

    func updateIsPresentedInputLectureView(isPresented: Bool) {
        isPresentedInputLectureView = isPresented
    }

    @MainActor
    func onAppear() {
        isLoading = true
        userAuthority = loadUserAuthorityUseCase()

        Task {
            do {
                lectureDetail = try await fetchLectureDetailUseCase(lectureID: lectureID)

                isLoading = false
            } catch {
                errorMessage = error.lectureDomainErrorMessage()

                isErrorOccurred = true
                isLoading = false
            }
        }
    }

    @MainActor
    func applyLecture() {
        Task {
            do {
                try await applyLectureUseCase(lectureID: lectureID)
            } catch {
                errorMessage = error.lectureDomainErrorMessage()

                isErrorOccurred = true
                isApply = false
            }
        }
    }

    func cancelLecture() {
        Task {
            do {
                try await cancelLectureUseCase(lectureID: lectureID)
            } catch {
                errorMessage = error.lectureDomainErrorMessage()

                isErrorOccurred = true
            }
        }
    }

    func deleteLecture(_ success: @escaping () -> Void) {
        Task {
            do {
                try await deleteLectureUseCase(lectureID: lectureID)

                success()
            } catch {
                errorMessage = error.lectureDomainErrorMessage()

                isErrorOccurred = true
            }
        }
    }
}
