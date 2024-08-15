import Service
import SwiftUI

final class LectureListDetailViewModel: BaseViewModel {
    @Published var lectureDetail: LectureDetailEntity?
    @Published var isSuccessEnrolment: Bool = false
    @Published var isCancel: Bool = false
    @Published var isApply: Bool = false
    @Published var isDraw: Bool = false
    @Published var isPresentedLectureApplicantListView: Bool = false
    @Published var userAuthority: UserAuthorityType = .user
    @Published var isPresentedLectureActionSheet: Bool = false
    @Published var isPresentedInputLectureView: Bool = false
    @Published var lectureLocation: Location = .init(
        locationX: 0.0,
        locationY: 0.0,
        address: "",
        locationDetails: ""
    )

    let lectureID: String
    private let fetchLectureDetailUseCase: any FetchLectureDetailUseCase
    private let applyLectureUseCase: any ApplyLectureUseCase
    private let cancelLectureApplicationUseCase: any CancelLectureApplicationUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let deleteLectureUseCase: any DeleteLectureUseCase

    init(
        lectureID: String,
        fetchLectureDetailUseCase: any FetchLectureDetailUseCase,
        applyLectureUseCase: any ApplyLectureUseCase,
        cancelLectureApplicationUseCase: any CancelLectureApplicationUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        deleteLectureUseCase: any DeleteLectureUseCase
    ) {
        self.lectureID = lectureID
        self.fetchLectureDetailUseCase = fetchLectureDetailUseCase
        self.applyLectureUseCase = applyLectureUseCase
        self.cancelLectureApplicationUseCase = cancelLectureApplicationUseCase
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

    func updateLectureLocation(location: Location) {
        lectureLocation = location
    }

    func updateLectureDetail(detail: LectureDetailEntity) {
        lectureDetail = detail
    }

    @MainActor
    func onAppear() {
        isLoading = true
        isDraw = true
        userAuthority = loadUserAuthorityUseCase()

        Task {
            do {
                let response = try await fetchLectureDetailUseCase(lectureID: lectureID)

                updateLectureDetail(detail: response)
                updateLectureLocation(
                    location: .init(
                        locationX: Double(response.locationX) ?? 0,
                        locationY: Double(response.locationY) ?? 0,
                        address: response.address,
                        locationDetails: response.locationDetails
                    )
                )

                isLoading = false
            } catch {
                errorMessage = error.lectureDomainErrorMessage()
                print(String(describing: error))

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
                try await cancelLectureApplicationUseCase(lectureID: lectureID)
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
