import Foundation
import Service

final class InputLectureViewModel: BaseViewModel {
    @Published var lectureTitle: String = ""
    @Published var lectureText: String = ""
    @Published var isPresentedLectureDetailSettingAppend = false
    @Published var lectureInfo: LectureDataModel = .init(
        semester: .firstYearFallSemester,
        division: "",
        department: "",
        line: "",
        instructorID: "",
        instructorName: "",
        startDate: Date(),
        endDate: Date(),
        lectureDates: [],
        lectureType: "상호학점인정교육과정",
        credit: 1,
        maxRegisteredUser: 0
    )

    let lectureID: String
    let state: String

    private let openLectureUseCase: any OpenLectureUseCase
    private let fetchLectureDetailUseCase: any FetchLectureDetailUseCase

    init(
        openLectureUseCase: any OpenLectureUseCase,
        lectureID: String,
        state: String,
        fetchLectureDetailUseCase: any FetchLectureDetailUseCase
    ) {
        self.openLectureUseCase = openLectureUseCase
        self.lectureID = lectureID
        self.state = state
        self.fetchLectureDetailUseCase = fetchLectureDetailUseCase
    }

    func updateIsPresentedLectureDetailSettingAppend(state: Bool) {
        isPresentedLectureDetailSettingAppend = state
    }

    func updateLectureTitle(title: String) {
        lectureTitle = title
    }

    func updateLectureText(text: String) {
        lectureText = text
    }

    func updateLectureInfo(detailInfo: LectureDataModel) {
        lectureInfo = .init(
            semester: detailInfo.semester,
            division: detailInfo.division,
            department: detailInfo.department,
            line: detailInfo.line,
            instructorID: detailInfo.instructorID, 
            instructorName: detailInfo.instructorName,
            startDate: detailInfo.startDate,
            endDate: detailInfo.endDate,
            lectureDates: detailInfo.lectureDates,
            lectureType: detailInfo.lectureType,
            credit: detailInfo.credit,
            maxRegisteredUser: detailInfo.maxRegisteredUser
        )
    }

    func onAppear() {
        switch state {
        case "개설 신청":
            return

        case "수정":
            Task {
                try await fetchLectureDetail()
            }

        default:
            return
        }

    }

    func fetchLectureDetail() async throws {
        let response = try await fetchLectureDetailUseCase(lectureID: lectureID)

        lectureInfo = .init(
            semester: response.semester,
            division: response.division,
            department: response.department,
            line: response.line,
            instructorID: response.userID,
            instructorName: response.instructor,
            startDate: response.startDate,
            endDate: response.endDate,
            lectureDates: response.lectureDates.map {
                .init(completeDate: $0.completeDate, startTime: $0.startTime, endTime: $0.endTime)
            },
            lectureType: response.lectureType,
            credit: response.credit,
            maxRegisteredUser: response.credit
        )
    }

    @MainActor
    func openLectureButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                try await openLectureUseCase(
                    req: OpenLectureRequestDTO(
                        name: lectureTitle,
                        content: lectureText,
                        semester: lectureInfo.semester,
                        division: lectureInfo.division,
                        department: lectureInfo.department,
                        line: lectureInfo.line,
                        userID: lectureInfo.instructorID,
                        startDate: lectureInfo.startDate.toStringCustomFormat(format: "yyyy-MM-dd'T'hh:mm:ss"),
                        endDate: lectureInfo.endDate.toStringCustomFormat(format: "yyyy-MM-dd'T'hh:mm:ss"),
                        lectureDates: lectureInfo.lectureDates.map {
                            OpenLectureRequestDTO.LectureDateInfo(
                                completeDate: $0.completeDate.toStringCustomFormat(format: "yyyy-MM-dd"),
                                startTime: $0.startTime.toStringCustomFormat(format: "hh:mm:ss"),
                                endTime: $0.endTime.toStringCustomFormat(format: "hh:mm:ss")
                            )
                        },
                        lectureType: lectureInfo.lectureType,
                        credit: lectureInfo.credit,
                        maxRegisteredUser: lectureInfo.maxRegisteredUser
                    )
                )

                success()
            } catch {
                errorMessage = error.lectureDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}