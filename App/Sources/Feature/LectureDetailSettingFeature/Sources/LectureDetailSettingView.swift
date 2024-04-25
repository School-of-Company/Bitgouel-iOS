import Service
import SwiftUI

struct LectureDetailSettingView: View {
    @StateObject var viewModel: LectureDetailSettingViewModel
    @Environment(\.dismiss) var dismiss

    private let openLectureApplyFactory: any OpenLectureApplyFactory

    init(
        viewModel: LectureDetailSettingViewModel,
        openLectureApplyFactory: any OpenLectureApplyFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.openLectureApplyFactory = openLectureApplyFactory
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .center) {
                if viewModel.isShowingLinePopup {
                    lectureLinePopup()
                } else if viewModel.isShowingInstructorPopup {
                    instructorPopup()
                }
            }
            .zIndex(1)

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
                        SelectedLectureTypeView(
                            selectedLectureType: viewModel.selectedLectureType,
                            selectedLectureTypeString: viewModel.selectedLectureTypeString
                        ) { isShowing in
                            viewModel.updateIsShowingLectureTypeBottomSheet(isShowing: isShowing)
                        } onChangeSelectedLectureType: { lectureType in
                            viewModel.updateLectureTypeString(lectureType: lectureType)
                        }

                        SelectedSemesterView(
                            selectedSemester: viewModel.selectedSemester
                        ) { isShowing in
                            viewModel.updateIsShowingSemesterBottomSheet(isShowing: isShowing)
                        }

                        SelectedDivisionView(
                            selectedDivision: viewModel.selectedDivision
                        ) { isShowing in
                            viewModel.updateIsShowingDivisionBottomSheet(isShowing: isShowing)
                        }

                        SelectedCreditView(
                            selectedCredit: viewModel.selectedCredit
                        ) { isShowing in
                            viewModel.updateIsShowingCreditBottomSheet(isShowing: isShowing)
                        }

                        SelectedPickerView(
                            selectedLine: viewModel.selectedLine,
                            selectedDepartment: viewModel.selectedDepartment,
                            selectedInstructorName: viewModel.instructorName
                        ) {
                            viewModel.updateIsShowingLinePopup(isShowing: true)
                        } onSelectDepartment: {
                            viewModel.updateIsShowingDepartmentBottomSheet(isShowing: true)
                        } onSelectInstructor: {
                            viewModel.updateIsShowingInstructorPopup(isShowing: true)
                        }

                        SelectedApplicationPeriodView(
                            selectedStartDate: viewModel.selectedStartDate,
                            selectedEndDate: viewModel.selectedEndDate
                        ) { date in
                            viewModel.updateSelectedStartDate(date: date)
                        } onSelectEndDate: { date in
                            viewModel.updateSelectedEndDate(date: date)
                        }

                        SelectedLectureDatesView(
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

                        SelectedMaxRegisteredUser(
                            maxRegisteredUser: viewModel.maxRegisteredUser
                        ) { userCount in
                            viewModel.updateMaxRegisteredUser(userCount: userCount)
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
        }
        .onChange(of: viewModel.isShowingLinePopup) { newValue in
            if newValue {
                viewModel.fetchLineList()
            }
        }
        .onChange(of: viewModel.isShowingDepartmentBottomSheet) { newValue in
            if newValue {
                viewModel.fetchDepartmentList()
            }
        }
        .onChange(of: viewModel.isShowingInstructorPopup) { newValue in
            if newValue {
                viewModel.fetchInstructorList()
            }
        }
        .onChange(of: viewModel.keyword) { newValue in
            if viewModel.isShowingLinePopup {
                viewModel.fetchLineList()
            } else if viewModel.isShowingDepartmentBottomSheet {
                viewModel.fetchDepartmentList()
            } else if viewModel.isShowingInstructorPopup {
                viewModel.fetchInstructorList()
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
        .bitgouelBottomSheet(isShowing: $viewModel.isShowingCreditBottomSheet) {
            CreditBottomSheet(
                selectedCredit: viewModel.selectedCredit,
                creditList: viewModel.creditValue
            ) { credit in
                viewModel.updateCredit(credit: credit)
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
    }

    @ViewBuilder
    func lectureLinePopup() -> some View {
        Color.black.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                viewModel.updateIsShowingLinePopup(isShowing: false)
            }
        
        LectureLinePopup(
            lineList: viewModel.lineList,
            selectedLine: viewModel.selectedLine,
            keyword: $viewModel.keyword,
            onLineSelect: { line in
                viewModel.updateSelectedLine(line: line)
                viewModel.updateIsShowingLinePopup(isShowing: false)
            },
            cancel: { isShowing in
                viewModel.keyword = ""
                viewModel.updateIsShowingLinePopup(isShowing: isShowing)
            }
        )
    }

    @ViewBuilder
    func instructorPopup() -> some View {
        Color.black.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                viewModel.updateIsShowingInstructorPopup(isShowing: false)
            }

        InstructorPopup(
            instructorList: viewModel.instructorList,
            selectedInstructorID: viewModel.instructorID,
            keyword: $viewModel.keyword,
            onInstructorSelect: { instructorName, instructorID in
                viewModel.updateInstructorInfo(
                    name: instructorName,
                    id: instructorID
                )
                viewModel.updateIsShowingInstructorPopup(isShowing: false)
            },
            cancel: { isShowing in
                viewModel.keyword = ""
                viewModel.updateIsShowingInstructorPopup(isShowing: false)
            }
        )
    }
}
