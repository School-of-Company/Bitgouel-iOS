import Foundation
import Service

final class OpenLectureApplyViewModel: ObservableObject {
    @Published var lectureTitle: String = ""
    @Published var lectureText: String = ""
    @Published var isPresentedLectureDetailSettingAppend = false
    @Published var openLectureInfo: OpenLectureModel = .init(
        semester: .firstYearFallSemester,
        division: "",
        department: "",
        line: "",
        instructorID: "",
        startDate: Date(),
        endDate: Date(),
        lectureDates: [],
        lectureType: "",
        credit: 0,
        maxRegisteredUser: 0
    )

    private let openLectureUseCase: any OpenLectureUseCase

    init(openLectureUseCase: any OpenLectureUseCase) {
        self.openLectureUseCase = openLectureUseCase
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

    func updateOpenLectureInfo(detailInfo: OpenLectureModel) {
        openLectureInfo = .init(
            semester: detailInfo.semester,
            division: detailInfo.division,
            department: detailInfo.department,
            line: detailInfo.line,
            instructorID: detailInfo.instructorID,
            startDate: detailInfo.startDate,
            endDate: detailInfo.endDate,
            lectureDates: detailInfo.lectureDates,
            lectureType: detailInfo.lectureType,
            credit: detailInfo.credit,
            maxRegisteredUser: detailInfo.maxRegisteredUser
        )
        print(openLectureInfo)
    }

    func openLectureButtonDidTap() {
        Task {
            do {
                try await openLectureUseCase(
                    req: OpenLectureRequestDTO(
                        name: lectureTitle,
                        content: lectureText,
                        semester: openLectureInfo.semester,
                        division: openLectureInfo.division,
                        department: openLectureInfo.department,
                        line: openLectureInfo.line,
                        userID: openLectureInfo.instructorID,
                        startDate: openLectureInfo.startDate.toStringCustomFormat(format: "yyyy-MM-dd'T'hh:mm:ss"),
                        endDate: openLectureInfo.endDate.toStringCustomFormat(format: "yyyy-MM-dd'T'hh:mm:ss"),
                        lectureDates: openLectureInfo.lectureDates.map {
                            OpenLectureRequestDTO.LectureDateInfo(
                                completeDate: $0.completeDate.toStringCustomFormat(format: "yyyy-MM-dd"),
                                startTime: $0.startTime.toStringCustomFormat(format: "hh:mm:ss"),
                                endTime: $0.endTime.toStringCustomFormat(format: "hh:mm:ss")
                            )
                        },
                        lectureType: openLectureInfo.lectureType,
                        credit: openLectureInfo.credit,
                        maxRegisteredUser: openLectureInfo.maxRegisteredUser
                    )
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
