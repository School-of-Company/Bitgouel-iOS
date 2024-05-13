import Service
import SwiftUI

struct LectureDetailSettingView: View {
    @StateObject var viewModel: LectureDetailSettingViewModel
    @Environment(\.dismiss) var dismiss

    private let openedLectureFactory: any OpenedLectureFactory

    init(
        viewModel: LectureDetailSettingViewModel,
        openedLectureFactory: any OpenedLectureFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.openedLectureFactory = openedLectureFactory
    }

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                BitgouelText(
                    text: "강의 세부 설정",
                    font: .title3
                )

                Spacer()

                BitgouelAsset.Icons.cancel.swiftUIImage
                    .buttonWrapper {
                        dismiss()
                    }
            }
            .padding(.top, 24)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    EssentialCompleteView(isComplete: $viewModel.isComplete) { isComplete in
                        viewModel.updateIsComplete(isComplete: isComplete)
                    }

                    SemesterView(
                        selectedSemester: viewModel.selectedSemester
                    ) { isShowing in
                        viewModel.updateIsShowingSemesterBottomSheet(isShowing: isShowing)
                    }

                    LectureTypeView(
                        selectedLectureType: viewModel.selectedLectureType,
                        selectedLectureTypeString: viewModel.selectedLectureTypeString
                    ) { isShowing in
                        viewModel.updateIsShowingLectureTypeBottomSheet(isShowing: isShowing)
                    } onChangeSelectedLectureType: { lectureType in
                        viewModel.updateLectureTypeString(lectureType: lectureType)
                    }

                    DivisionView(
                        selectedDivision: viewModel.selectedDivision
                    ) { isShowing in
                        viewModel.updateIsShowingDivisionBottomSheet(isShowing: isShowing)
                    }

                    PickerView(
                        selectedLine: viewModel.selectedLine,
                        selectedDepartment: viewModel.selectedDepartment,
                        selectedInstructorName: viewModel.instructorName
                    ) {
                        viewModel.updateIsShowingLineBottomSheet(isShowing: true)
                    } onSelectDepartment: {
                        viewModel.updateIsShowingDepartmentBottomSheet(isShowing: true)
                    } onSelectInstructor: {
                        viewModel.updateIsShowingInstructorBottomSheet(isShowing: true)
                    }

                    ApplicationPeriodView(
                        selectedStartDate: $viewModel.selectedStartDate,
                        selectedEndDate: $viewModel.selectedEndDate
                    )

                    LectureDatesView(
                        lectureDatesList: viewModel.lectureDatesList
                    ) { completeDate, index in
                        viewModel.updateCompleteDate(
                            completedate: completeDate,
                            at: index
                        )
                    } onSelectStartTime: { startTime, index in
                        viewModel.updateStartTime(
                            startTime: startTime,
                            at: index
                        )
                    } onSelectEndTime: { endTime, index in
                        viewModel.updateEndTime(
                            endTime: endTime,
                            at: index
                        )
                    } addLectureDates: {
                        viewModel.appendLectureDate()
                    } deleteLectureDates: { index in
                        viewModel.deleteLectureDate(at: index)
                    }

                    CreditView(selectedCredit: $viewModel.selectedCredit) { credit in
                        viewModel.updateCredit(credit: credit)
                    }

                    MaxRegisteredUserView(maxRegisteredUser: $viewModel.selectedMaxRegisteredUser) { isShowing in
                        viewModel.updateIsShowingMaxRegisteredUserBottomSheet(isShowing: isShowing)
                    }
                }
                .padding(.bottom, 24)
            }

            BitgouelButton(
                text: "적용 하기",
                style: .primary
            ) {
                viewModel.applyButtonDidTap()
                dismiss()
            }
        }
        .padding(.horizontal, 28)
        .onChange(of: viewModel.isShowingLineBottomSheet) { newValue in
            if newValue {
                viewModel.fetchLineList()
            }
        }
        .onChange(of: viewModel.isShowingDepartmentBottomSheet) { newValue in
            if newValue {
                viewModel.fetchDepartmentList()
            }
        }
        .onChange(of: viewModel.isShowingInstructorBottomSheet) { newValue in
            if newValue {
                viewModel.fetchInstructorList()
            }
        }
        .onChange(of: viewModel.isShowingDivisionBottomSheet) { newValue in
            if newValue {
                viewModel.fetchDivisionList()
            }
        }
        .onChange(of: viewModel.keyword) { newValue in
            if viewModel.isShowingLineBottomSheet {
                viewModel.fetchLineList()
            } else if viewModel.isShowingDepartmentBottomSheet {
                viewModel.fetchDepartmentList()
            } else if viewModel.isShowingInstructorBottomSheet {
                viewModel.fetchInstructorList()
            } else if viewModel.isShowingDivisionBottomSheet {
                viewModel.fetchDivisionList()
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingSemesterBottomSheet) {
            SemesterBottomSheet(
                semesterList: viewModel.semesterList,
                selectedSemester: viewModel.selectedSemester
            ) { semester in
                viewModel.updateSemester(semester: semester)
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingLectureTypeBottomSheet) {
            LectureTypeBottomSheet(
                selectedLectureType: viewModel.selectedLectureType,
                lectureTypeList: viewModel.lectureTypeList
            ) { lectureType in
                viewModel.updateLectrureType(lectureType: lectureType)
                viewModel.updateLectureTypeString(lectureType: lectureType.rawValue)
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingDivisionBottomSheet) {
            DivisionBottomSheet(
                selectedDivision: viewModel.selectedDivision,
                keyword: $viewModel.keyword,
                divisionList: viewModel.divisionList
            ) { division in
                viewModel.updateDivision(division: division)
                viewModel.resetKeyword()
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingLineBottomSheet) {
            LineBottomSheet(
                selectedLine: viewModel.selectedLine,
                keyword: $viewModel.keyword,
                lineList: viewModel.lineList
            ) { line in
                viewModel.updateLine(line: line)
                viewModel.resetKeyword()
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingDepartmentBottomSheet) {
            DepartmentBottomSheet(
                selectedDepartment: viewModel.selectedDepartment,
                keyword: $viewModel.keyword,
                departmentList: viewModel.departmentList
            ) { department in
                viewModel.updateSelectedDepartment(department: department)
                viewModel.resetKeyword()
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingInstructorBottomSheet) {
            InstructorBottomSheet(
                instructorList: viewModel.instructorList,
                selectedInstructorID: viewModel.instructorID,
                keyword: $viewModel.keyword
            ) { name, id in
                viewModel.updateInstructorInfo(name: name, id: id)
                viewModel.resetKeyword()
            }
        }
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingMaxRegisteredUserBottomSheet) {
            MaxRegisteredUserBottomSheet(selectedMaxRegisteredUser: $viewModel.selectedMaxRegisteredUser)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
