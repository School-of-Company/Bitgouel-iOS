import Foundation
import Service

public struct LectureDataModel: Equatable {
    let semester: SemesterType
    let division: String
    let department: String
    let line: String
    let instructorID: String
    let instructorName: String
    let startDate: Date
    let endDate: Date
    let lectureDates: [LectureDatesModel]
    let lectureType: String
    let credit: Int
    let maxRegisteredUser: Int
    let address: String
    let locationDetails: String
    let essentialComplete: Bool
}
