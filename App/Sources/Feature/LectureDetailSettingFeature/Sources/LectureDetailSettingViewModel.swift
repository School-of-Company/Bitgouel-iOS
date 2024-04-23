import Foundation
import Service
import SwiftUI

final class LectureDetailSettingViewModel: BaseViewModel {
    // MARK: Lecture
    @Published var lectureType: [LectureType] = LectureType.allCases
    @Published var selectedLectureType: LectureType = .mutualCreditRecognitionProgram

    // MARK: Semester
    @Published var isShowingSemesterBottomSheet = false
    @Published var semesterList: [SemesterType] = SemesterType.allCases
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
        .init(completeDate: Date(), startTime: Date(), endTime: Date())
    ]

    @Published var isShowingLinePopup: Bool = false
    @Published var isShowingDepartmentPopup: Bool = false
    @Published var isShowingInstructorPopup: Bool = false
    @Published var keyword: String = ""
    @Published var maxRegisteredUser: Int = 0
    var detailInfo: OpenLectureModel
    let completion: (OpenLectureModel) -> Void

    private let fetchInstructorListUseCase: any FetchInstructorListUseCase
    private let fetchLineListUseCase: any FetchLineListUseCase
    private let fetchDepartmentListUseCase: any FetchDepartmentListUseCase

    init(
        detailInfo: OpenLectureModel,
        completion: @escaping (OpenLectureModel) -> Void,
        fetchInstructorListUseCase: any FetchInstructorListUseCase,
        fetchLineListUseCase: any FetchLineListUseCase,
        fetchDepartmentListUseCase: any FetchDepartmentListUseCase
    ) {
        self.detailInfo = detailInfo
        self.completion = completion
        self.fetchInstructorListUseCase = fetchInstructorListUseCase
        self.fetchLineListUseCase = fetchLineListUseCase
        self.fetchDepartmentListUseCase = fetchDepartmentListUseCase
    }

    func updateLectureType(lectureType: LectureType) {
        selectedLectureType = lectureType
    }

    func updateIsShowingSemesterBottomSheet(isShowing: Bool) {
        isShowingSemesterBottomSheet = isShowing
    }

    func updateSemester(semester: SemesterType) {
        selectedSemester = semester
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
        isShowingInstructorPopup = isShowing
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
            completeDate: completedate,
            startTime: indexedDate.startTime,
            endTime: indexedDate.endTime
        )
        lectureDatesList[index] = newLectureDatesModel
    }

    func updateStartTime(startTime: Date, at index: Int) {
        let indexedDate = self.lectureDatesList[index]
        let newLectureDatesModel = LectureDatesModel(
            completeDate: indexedDate.completeDate,
            startTime: startTime,
            endTime: indexedDate.endTime
        )
        lectureDatesList[index] = newLectureDatesModel
    }

    func updateEndTime(endTime: Date, at index: Int) {
        let indexedDate = self.lectureDatesList[index]
        let newLectureDatesModel = LectureDatesModel(
            completeDate: indexedDate.completeDate,
            startTime: indexedDate.startTime,
            endTime: endTime
        )
        lectureDatesList[index] = newLectureDatesModel
    }

    func deleteLectureDate(at index: Int) {
        lectureDatesList.remove(at: index)
    }

    func appendLectureDate() {
        lectureDatesList.append(
            .init(completeDate: Date(), startTime: Date(), endTime: Date())
        )
    }

    func updateMaxRegisteredUser(userCount: Int?) {
        guard let userCount else { return }
        maxRegisteredUser = userCount
    }

    func applyButtonDidTap() {
        detailInfo = .init(
            semester: selectedSemester,
            division: selectedDivision,
            department: selectedDepartment,
            line: selectedLine,
            instructorID: instructorID,
            startDate: selectedStartDate,
            endDate: selectedEndDate,
            lectureDates: lectureDatesList,
            lectureType: selectedLectureType,
            credit: selectedCredit,
            maxRegisteredUser: maxRegisteredUser
        )

        completion(detailInfo)
    }

    @MainActor
    func fetchLineList() {
        Task {
            do {
                lineList = try await fetchLineListUseCase(keyword: keyword, division: selectedDivision.rawValue)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func fetchDepartmentList() {
        Task {
            do {
                departmentList = try await fetchDepartmentListUseCase(keyword: keyword)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func fetchInstructorList() {
        Task {
            do {
                instructorList = try await fetchInstructorListUseCase(keyword: keyword)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
