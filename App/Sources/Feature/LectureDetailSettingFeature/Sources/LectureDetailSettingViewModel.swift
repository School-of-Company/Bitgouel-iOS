import Foundation
import Service
import SwiftUI

final class LectureDetailSettingViewModel: BaseViewModel {
    // MARK: Lecture
    @Published var lectureType: [LectureType] = LectureType.allCases
    @Published var selectedLectureType: LectureType = .mutualCreditRecognitionProgram

    // MARK: Semester
    @Published var springSemesterType: [SpringSemesterType] = SpringSemesterType.allCases
    @Published var fallSemesterType: [FallSemesterType] = FallSemesterType.allCases
    @Published var selectedSemester: SemesterType = .firstYearFallSemester

    // MARK: Division
    @Published var industryDivisionType: [IndustryDivisionType] = IndustryDivisionType.allCases
    @Published var otherDivisionType: [OtherDivisionType] = OtherDivisionType.allCases
    @Published var selectedDivision: DivisionType = .automobileIndustry

    // MARK: credit
    let creditValue: [Int] = [1, 2]
    @Published var selectedCredit: Int = 1

    // MARK: Line
    @Published var lineList: [String] = []
    @Published var selectedLine: String = ""

    // MARK: Department
    @Published var departmentList: [String] = []
    @Published var selectedDepartment: String = ""

    // MARK: Instructor
    @Published var instructorList: [InstructorInfoEntity] = []
    @Published var instructorID: String = ""
    @Published var instructorName: String = ""

    // MARK: Date
    @Published var selectedStartDate = Date()
    @Published var selectedEndDate = Date()
    @Published var lectureDatesList: [LectureDatesModel] = [
        .init(completeDate: "", startTime: "", endTime: "")
    ]

    @Published var isShowingLinePopup: Bool = false
    @Published var isShowingDepartmentPopup: Bool = false
    @Published var isShowingLecturerPopup: Bool = false
    @Published var keyword: String = ""
    @Published var maxRegisteredUser: Int = 0

    func updateLectureType(lectureType: LectureType) {
        selectedLectureType = lectureType
    }

    func updateSemester(semester: String) {
        switch semester {
        case "SECOND_YEAR_SPRING_SEMESTER":
            selectedSemester = .secondYearSpringSemester

        case "SECOND_YEAR_FALL_SEMESTER":
            selectedSemester = .secondYearFallSemester

        case "THIRD_YEAR_SPRING_SEMESTER":
            selectedSemester = .thirdYearSpringSemester

        default:
            selectedSemester = .firstYearFallSemester
        }
    }

    func updateDivision(division: String) {
        switch division {
        case "ENERGY_INDUSTRY":
            selectedDivision = .energyIndustry

        case "MEDICAL_HEALTHCARE":
            selectedDivision = .medicalHealthcare

        case "AI_CONVERGENCE":
            selectedDivision = .AIConvergence

        case "CULTURAL_INDUSTRY":
            selectedDivision = .cultureIndustry

        default:
            selectedDivision = .automobileIndustry
        }
    }

    func updateCredit(credit: Int) {
        selectedCredit = credit
    }

    func updateIsShowingLinePopup(isShowing: Bool) {
        isShowingLinePopup = isShowing
    }

    func updateIsShowingDepartmentPopup(isShowing: Bool) {
        isShowingDepartmentPopup = isShowing
    }

    func updateIsShowingInstructorPopup(isShowing: Bool) {
        isShowingLecturerPopup = isShowing
    }

    func updateSelectedLine(line: String) {
        selectedLine = line
    }

    func updateSelectedDepartment(department: String) {
        selectedDepartment = department
    }

    func updateInstructorInfo(name: String, id: String) {
        instructorName = name
        instructorID = id
    }

    func updateSelectedStartDate(date: Date) {
        selectedStartDate = date
    }

    func updateSelectedEndDate(date: Date) {
        selectedEndDate = date
    }

    func updateCompleteDate(completedate: Date, at index: Int) {
        let indexedDate = self.lectureDatesList[index]
        let newLectureDatesModel = LectureDatesModel(
            completeDate: completedate.toStringCustomFormat(format: "yyyy-MM-dd"),
            startTime: indexedDate.startTime,
            endTime: indexedDate.endTime
        )
        lectureDatesList[index] = newLectureDatesModel
    }

    func updateStartTime(startTime: Date, at index: Int) {
        let indexedDate = self.lectureDatesList[index]
        let newLectureDatesModel = LectureDatesModel(
            completeDate: indexedDate.completeDate,
            startTime: startTime.toStringCustomFormat(format: "hh:ss:mm"),
            endTime: indexedDate.endTime
        )
        lectureDatesList[index] = newLectureDatesModel
    }

    func updateEndTime(endTime: Date, at index: Int) {
        let indexedDate = self.lectureDatesList[index]
        let newLectureDatesModel = LectureDatesModel(
            completeDate: indexedDate.completeDate,
            startTime: indexedDate.startTime,
            endTime: endTime.toStringCustomFormat(format: "hh:mm:ss")
        )
        lectureDatesList[index] = newLectureDatesModel
    }

    func deleteLectureDate(at index: Int) {
        lectureDatesList.remove(at: index)
    }

    func appendLectureDate() {
        lectureDatesList.append(
            .init(completeDate: "", startTime: "", endTime: "")
        )
    }

    func updateMaxRegisteredUser(userCount: Int?) {
        guard let userCount else { return }
        maxRegisteredUser = userCount
    }
}
