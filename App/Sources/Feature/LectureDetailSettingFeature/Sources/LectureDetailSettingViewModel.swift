import Foundation
import Service
import SwiftUI

final class LectureDetailSettingViewModel: BaseViewModel {
    // MARK: LectureType
    @Published var isShowingLectureTypeBottomSheet: Bool = false
    @Published var selectedLectureType: LectureType = .mutualCreditRecognitionProgram
    @Published var selectedLectureTypeString: String = "상호학점인정교육과정"
    let lectureTypeList: [LectureType] = LectureType.allCases

    // MARK: Semester
    @Published var isShowingSemesterBottomSheet: Bool = false
    @Published var selectedSemester: SemesterType = .firstYearFallSemester
    let semesterList: [SemesterType] = SemesterType.allCases

    // MARK: Division
    @Published var isShowingDivisionBottomSheet: Bool = false
    @Published var divisionList: [String] = []
    @Published var selectedDivision: String = ""

    // MARK: credit
    @Published var credit: String = ""
    var selectedCredit: Int?

    // MARK: Line
    @Published var isShowingLineBottomSheet: Bool = false
    @Published var lineList: [String] = []
    @Published var selectedLine: String = ""

    // MARK: Department
    @Published var isShowingDepartmentBottomSheet: Bool = false
    @Published var departmentList: [String] = []
    @Published var selectedDepartment: String = ""

    // MARK: Instructor
    @Published var isShowingInstructorBottomSheet: Bool = false
    @Published var instructorList: [InstructorInfoEntity] = []
    @Published var instructorID: String = ""
    @Published var instructorName: String = ""

    // MARK: Date
    @Published var selectedStartDate = Date()
    @Published var selectedEndDate = Date()
    @Published var lectureDatesList: [LectureDatesModel] = [
        .init(completeDate: Date(), startTime: Date(), endTime: Date())
    ]

    // MARK: isComplete
    @Published var isComplete: Bool = true

    @Published var keyword: String = ""
    @Published var maxRegisteredUser: String = ""
    var selectedMaxRegisteredUser: Int?
    var detailInfo: OpenLectureModel
    let completion: (OpenLectureModel) -> Void

    private let fetchInstructorListUseCase: any FetchInstructorListUseCase
    private let fetchLineListUseCase: any FetchLineListUseCase
    private let fetchDepartmentListUseCase: any FetchDepartmentListUseCase
    private let fetchDivisionListUseCase: any FetchDivisionListUseCase

    init(
        detailInfo: OpenLectureModel,
        completion: @escaping (OpenLectureModel) -> Void,
        fetchInstructorListUseCase: any FetchInstructorListUseCase,
        fetchLineListUseCase: any FetchLineListUseCase,
        fetchDepartmentListUseCase: any FetchDepartmentListUseCase,
        fetchDivisionListUseCase: any FetchDivisionListUseCase
    ) {
        self.detailInfo = detailInfo
        self.completion = completion
        self.fetchInstructorListUseCase = fetchInstructorListUseCase
        self.fetchLineListUseCase = fetchLineListUseCase
        self.fetchDepartmentListUseCase = fetchDepartmentListUseCase
        self.fetchDivisionListUseCase = fetchDivisionListUseCase
    }

    func updateIsComplete(isComplete: Bool) {
        self.isComplete = isComplete
    }

    func resetKeyword() {
        keyword = ""
    }

    func updateMaxRegisteredUser(userCount: Int?) {
        guard let userCount else { return }
        selectedMaxRegisteredUser = userCount
    }

    // MARK: LectureType Func
    func updateLectrureType(lectureType: LectureType) {
        selectedLectureType = lectureType
    }

    func updateLectureTypeString(lectureType: String) {
        selectedLectureTypeString = lectureType
    }

    func updateIsShowingLectureTypeBottomSheet(isShowing: Bool) {
        isShowingLectureTypeBottomSheet = isShowing
    }

    // MARK: Semester Func
    func updateSemester(semester: SemesterType) {
        selectedSemester = semester
    }

    func updateIsShowingSemesterBottomSheet(isShowing: Bool) {
        isShowingSemesterBottomSheet = isShowing
    }

    // MARK: Division Func
    func updateDivision(division: String) {
        selectedDivision = division
    }

    func updateIsShowingDivisionBottomSheet(isShowing: Bool) {
        isShowingDivisionBottomSheet = isShowing
    }

    // MARK: Credit Func
    func updateCredit(credit: Int?) {
        guard let credit else { return }
        selectedCredit = credit
    }

    // MARK: Line Func
    func updateLine(line: String) {
        selectedLine = line
    }

    func updateIsShowingLineBottomSheet(isShowing: Bool) {
        isShowingLineBottomSheet = isShowing
    }

    // MARK: Department Func
    func updateSelectedDepartment(department: String) {
        selectedDepartment = department
    }

    func updateIsShowingDepartmentBottomSheet(isShowing: Bool) {
        isShowingDepartmentBottomSheet = isShowing
    }

    // MARK: Instructor Func
    func updateInstructorInfo(name: String, id: String) {
        instructorName = name
        instructorID = id
    }

    func updateIsShowingInstructorBottomSheet(isShowing: Bool) {
        isShowingInstructorBottomSheet = isShowing
    }

    // MARK: Date
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

    func applyButtonDidTap() {
        guard let credit = selectedCredit else { return }
        guard let maxRegisteredUser = selectedMaxRegisteredUser else { return }

        detailInfo = .init(
            semester: selectedSemester,
            division: selectedDivision,
            department: selectedDepartment,
            line: selectedLine,
            instructorID: instructorID,
            startDate: selectedStartDate,
            endDate: selectedEndDate,
            lectureDates: lectureDatesList,
            lectureType: selectedLectureTypeString,
            credit: credit,
            maxRegisteredUser: maxRegisteredUser
        )

        completion(detailInfo)
    }

    @MainActor
    func fetchLineList() {
        Task {
            do {
                lineList = try await fetchLineListUseCase(keyword: keyword, division: selectedDivision)
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

    @MainActor
    func fetchDivisionList() {
        Task {
            do {
                divisionList = try await fetchDivisionListUseCase(keyword: keyword)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
