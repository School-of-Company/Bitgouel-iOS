import Service
import SwiftUI

final class LectureDetailSettingViewModel: BaseViewModel {
    // MARK: LectureType
    @Published var isShowingLectureTypeBottomSheet: Bool = false
    @Published var selectedLectureType: LectureType = .mutualCreditRecognitionProgram
    @Published var lectureTypeString: String = ""

    // MARK: Semester
    @Published var isShowingSemesterBottomSheet: Bool = false
    @Published var selectedSemester: SemesterType = .firstYearFallSemester

    // MARK: Division
    @Published var isShowingDivisionBottomSheet: Bool = false
    @Published var divisionList: [String] = []
    @Published var selectedDivision: String = ""

    // MARK: credit
    @Published var selectedCredit: Int = 0

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

    // MARK: MaxRegisteredUser
    @Published var selectedMaxRegisteredUser: Int = 0
    @Published var isShowingMaxRegisteredUserBottomSheet: Bool = false

    @Published var isEssential: Bool = true
    @Published var keyword: String = ""
    @Published var detailInfo: LectureDataModel
    let completion: (LectureDataModel) -> Void

    private let searchInstructorUseCase: any SearchInstructorUseCase
    private let searchLineUseCase: any SearchLineUseCase
    private let searchDepartmentUseCase: any SearchDepartmentUseCase
    private let searchDivisionUseCase: any SearchDivisionUseCase

    init(
        detailInfo: LectureDataModel,
        completion: @escaping (LectureDataModel) -> Void,
        searchInstructorUseCase: any SearchInstructorUseCase,
        searchLineUseCase: any SearchLineUseCase,
        searchDepartmentUseCase: any SearchDepartmentUseCase,
        searchDivisionUseCase: any SearchDivisionUseCase
    ) {
        self.detailInfo = detailInfo
        self.completion = completion
        self.searchInstructorUseCase = searchInstructorUseCase
        self.searchLineUseCase = searchLineUseCase
        self.searchDepartmentUseCase = searchDepartmentUseCase
        self.searchDivisionUseCase = searchDivisionUseCase
    }

    func updateIsEssential(isEssential: Bool) {
        self.isEssential = isEssential
    }

    func resetKeyword() {
        keyword = ""
    }

    // MARK: MaxRegisteredUser Func
    func updateIsShowingMaxRegisteredUserBottomSheet(isShowing: Bool) {
        isShowingMaxRegisteredUserBottomSheet = isShowing
    }

    func updateMaxRegisterUser(maxRegisterUser: Int) {
        selectedMaxRegisteredUser = maxRegisterUser
    }

    // MARK: LectureType Func
    func updateSelectedLectureType(lectureType: LectureType) {
        selectedLectureType = lectureType
    }

    func updateLectureType(lectureType: String) {
        lectureTypeString = lectureType

        switch lectureType {
        case "상호학점인정교육과정":
            if selectedSemester == .notApplicable { updateSemester(semester: .firstYearFallSemester) }
            updateSelectedLectureType(lectureType: .mutualCreditRecognitionProgram)

        case "대학탐방프로그램":
            updateSelectedLectureType(lectureType: .universityExplorationProgram)
            updateSemester(semester: .notApplicable)

        case "유관기관프로그램":
            if selectedSemester == .notApplicable { updateSemester(semester: .firstYearFallSemester) }
            updateSelectedLectureType(lectureType: .governmentProgram)

        case "기업산학연계직업체험프로그램":
            if selectedSemester == .notApplicable { updateSemester(semester: .firstYearFallSemester) }
            updateSelectedLectureType(lectureType: .companyIndustryLinkingJobExperienceProgram)

        default:
            updateSelectedLectureType(lectureType: .etc)
        }
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
    func updateCredit(credit: Int) {
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
    func updateDepartment(department: String) {
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
    func updateStartDate(startDate: Date) {
        selectedStartDate = startDate
    }

    func updateEndDate(endDate: Date) {
        selectedEndDate = endDate
    }

    func updateLectureDates(lectureDates: [LectureDatesModel]) {
        lectureDatesList = lectureDates
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
        detailInfo = .init(
            semester: selectedSemester,
            division: selectedDivision,
            department: selectedDepartment,
            line: selectedLine,
            instructorID: instructorID,
            instructorName: instructorName,
            startDate: selectedStartDate,
            endDate: selectedEndDate,
            lectureDates: lectureDatesList,
            lectureType: lectureTypeString,
            credit: selectedCredit,
            maxRegisteredUser: selectedMaxRegisteredUser
        )

        completion(detailInfo)
    }

    func onAppear() {
        updateSemester(semester: detailInfo.semester)
        updateDivision(division: detailInfo.division)
        updateDepartment(department: detailInfo.department)
        updateLine(line: detailInfo.line)
        updateInstructorInfo(name: detailInfo.instructorName, id: detailInfo.instructorID)
        updateStartDate(startDate: detailInfo.startDate)
        updateEndDate(endDate: detailInfo.endDate)
        updateLectureDates(lectureDates: detailInfo.lectureDates)
        updateLectureType(lectureType: detailInfo.lectureType)
        updateCredit(credit: detailInfo.credit)
        updateMaxRegisterUser(maxRegisterUser: detailInfo.maxRegisteredUser)
    }

    @MainActor
    func searchLine() {
        Task {
            do {
                lineList = try await searchLineUseCase(keyword: keyword, division: selectedDivision)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func searchDepartment() {
        Task {
            do {
                departmentList = try await searchDepartmentUseCase(keyword: keyword)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func searchInstructor() {
        Task {
            do {
                instructorList = try await searchInstructorUseCase(keyword: keyword)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func searchDivision() {
        Task {
            do {
                divisionList = try await searchDivisionUseCase(keyword: keyword)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
