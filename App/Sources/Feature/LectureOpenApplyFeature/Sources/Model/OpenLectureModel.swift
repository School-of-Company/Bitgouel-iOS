import Foundation
import Service

public struct OpenLectureModel: Equatable {
    let semester: SemesterType
    let division: DivisionType
    let department: String
    let line: String
    let instructorID: String
    let startDate: Date
    let endDate: Date
    let lectureDates: [LectureDatesModel]
    let lectureType: String
    let credit: Int
    let maxRegisteredUser: Int
}
