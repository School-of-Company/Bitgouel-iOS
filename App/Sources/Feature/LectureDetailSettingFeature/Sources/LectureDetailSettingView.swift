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
                } else if viewModel.isShowingDepartmentPopup {
                    lectureDepartmentPopup()
                } else if viewModel.isShowingInstructorPopup {
                    instructorPopup()
                }
            }
            .zIndex(1)

            VStack(spacing: 28) {
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
                            lectureTypeList: viewModel.lectureType,
                            selectedLectureType: viewModel.selectedLectureType
                        ) { lectureType in
                            viewModel.updateLectureType(lectureType: lectureType)
                        }

                        SelectedSemesterView(
                            springSemesterList: viewModel.springSemesterType,
                            fallSemesterList: viewModel.fallSemesterType,
                            selectedSemester: viewModel.selectedSemester
                        ) { semester in
                            viewModel.updateSemester(semester: semester)
                        }

                        SelectedDivisionView(
                            industryDivisionList: viewModel.industryDivisionType,
                            otherDivisionList: viewModel.otherDivisionType,
                            selectedDivision: viewModel.selectedDivision
                        ) { division in
                            viewModel.updateDivision(division: division)
                        }

                        SelectedCreditView(
                            creditList: viewModel.creditValue,
                            selectedCredit: viewModel.selectedCredit
                        ) { credit in
                            viewModel.updateCredit(credit: credit)
                        }

                        SelectedPickerView(
                            selectedLine: viewModel.selectedLine,
                            selectedDepartment: viewModel.selectedDepartment,
                            selectedInstructorName: viewModel.instructorName
                        ) {
                            viewModel.updateIsShowingLinePopup(isShowing: true)
                        } onSelectDepartment: {
                            viewModel.updateIsShowingDepartmentPopup(isShowing: true)
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
        .onChange(of: viewModel.isShowingDepartmentPopup) { newValue in
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
            } else if viewModel.isShowingDepartmentPopup {
                viewModel.fetchDepartmentList()
            } else if viewModel.isShowingInstructorPopup {
                viewModel.fetchInstructorList()
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
            division: viewModel.selectedDivision,
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
    func lectureDepartmentPopup() -> some View {
        Color.black.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                viewModel.updateIsShowingDepartmentPopup(isShowing: false)
            }

        LectureDepartmentPopup(
            departmentList: viewModel.departmentList,
            selectedDepartment: viewModel.selectedDepartment,
            keyword: $viewModel.keyword,
            onDepartmentSelect: { department in
                viewModel.updateSelectedDepartment(department: department)
                viewModel.updateIsShowingDepartmentPopup(isShowing: false)
            },
            cancel: { isShowing in
                viewModel.keyword = ""
                viewModel.updateIsShowingDepartmentPopup(isShowing: isShowing)
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
