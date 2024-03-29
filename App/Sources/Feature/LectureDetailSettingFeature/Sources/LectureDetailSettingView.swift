import SwiftUI
import Service

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
            VStack {
                HStack {
                    BitgouelText(
                        text: "강의 세부 설정",
                        font: .title3
                    )

                    Spacer()

                    BitgouelAsset.Icons.cancel.swiftUIImage
                        .buttonWrapper { dismiss() }
                }
                .padding(.vertical, 24)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 28) {
                        VStack(alignment: .leading, spacing: 0) {
                            Group {
                                BitgouelText(
                                    text: "강의 유형",
                                    font: .text1
                                )
                                .padding(.bottom, 8)
                                
                                selectButton(
                                    text: "상호학점인정교육과정",
                                    select: viewModel.isSelectedMutualCreditRecognitionProgram
                                )
                                .buttonWrapper {
                                    viewModel.isSelectedMutualCreditRecognitionProgram.toggle()
                                    viewModel.isSelectedUniversityExplorationProgram = false
                                }
                                .padding(.bottom, 16)
                                
                                selectButton(
                                    text: "대학탐방프로그램",
                                    select: viewModel.isSelectedUniversityExplorationProgram
                                )
                                .buttonWrapper {
                                    viewModel.isSelectedUniversityExplorationProgram.toggle()
                                    viewModel.isSelectedMutualCreditRecognitionProgram = false
                                }
                                .padding(.bottom, 28)
                                
                                BitgouelText(
                                    text: "수강 학기",
                                    font: .text1
                                )
                                .padding(.bottom, 8)
                                
                                HStack(spacing: 16) {
                                    selectButton(
                                        text: "1학년 2학기",
                                        select: viewModel.isSelectedGradeOneSemesterTwo
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedGradeOneSemesterTwo.toggle()
                                        viewModel.isSelectedGradeThreeSemesterOne = false
                                        viewModel.isSelectedGradeTwoSemesterOne = false
                                        viewModel.isSelectedGradeTwoSemesterTwo = false
                                    }
                                    
                                    selectButton(
                                        text: "2학년 1학기",
                                        select: viewModel.isSelectedGradeTwoSemesterOne
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedGradeTwoSemesterOne.toggle()
                                        viewModel.isSelectedGradeOneSemesterTwo = false
                                        viewModel.isSelectedGradeThreeSemesterOne = false
                                        viewModel.isSelectedGradeTwoSemesterTwo = false
                                    }
                                }
                                .padding(.bottom, 16)
                                
                                HStack(spacing: 16) {
                                    selectButton(
                                        text: "2학년 2학기",
                                        select: viewModel.isSelectedGradeTwoSemesterTwo
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedGradeTwoSemesterTwo.toggle()
                                        viewModel.isSelectedGradeOneSemesterTwo = false
                                        viewModel.isSelectedGradeThreeSemesterOne = false
                                        viewModel.isSelectedGradeTwoSemesterOne = false
                                    }
                                    
                                    selectButton(
                                        text: "3학년 1학기",
                                        select: viewModel.isSelectedGradeThreeSemesterOne
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedGradeThreeSemesterOne.toggle()
                                        viewModel.isSelectedGradeOneSemesterTwo = false
                                        viewModel.isSelectedGradeTwoSemesterOne = false
                                        viewModel.isSelectedGradeTwoSemesterTwo = false
                                    }
                                }
                                .padding(.bottom, 28)
                                
                                BitgouelText(
                                    text: "강의 구분",
                                    font: .text1
                                )
                                .padding(.bottom, 8)
                                
                                HStack(spacing: 16) {
                                    selectButton(
                                        text: "자동차 산업",
                                        select: viewModel.isSelectedAutomobileIndustry
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedAutomobileIndustry.toggle()
                                        viewModel.isSelectedCulture = false
                                        viewModel.isSelectedEnergy = false
                                        viewModel.isSelectedAiFusionComplex = false
                                        viewModel.isSelectedMedicalHealth = false
                                    }
                                    
                                    selectButton(
                                        text: "에너지 산업",
                                        select: viewModel.isSelectedEnergy
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedEnergy.toggle()
                                        viewModel.isSelectedAutomobileIndustry = false
                                        viewModel.isSelectedCulture = false
                                        viewModel.isSelectedAiFusionComplex = false
                                        viewModel.isSelectedMedicalHealth = false
                                    }
                                }
                                .padding(.bottom, 16)
                                
                                HStack(spacing: 16) {
                                    selectButton(
                                        text: "의료•헬스",
                                        select: viewModel.isSelectedMedicalHealth
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedMedicalHealth.toggle()
                                        viewModel.isSelectedAutomobileIndustry = false
                                        viewModel.isSelectedCulture = false
                                        viewModel.isSelectedEnergy = false
                                        viewModel.isSelectedAiFusionComplex = false
                                    }
                                    
                                    selectButton(
                                        text: "AI 융•복합",
                                        select: viewModel.isSelectedAiFusionComplex
                                    )
                                    .buttonWrapper {
                                        viewModel.isSelectedAiFusionComplex.toggle()
                                        viewModel.isSelectedAutomobileIndustry = false
                                        viewModel.isSelectedCulture = false
                                        viewModel.isSelectedEnergy = false
                                        viewModel.isSelectedMedicalHealth = false
                                    }
                                }
                                .padding(.bottom, 16)
                                
                                selectButton(
                                    text: "문화 산업",
                                    select: viewModel.isSelectedCulture
                                )
                                .buttonWrapper {
                                    viewModel.isSelectedCulture.toggle()
                                    viewModel.isSelectedAutomobileIndustry = false
                                    viewModel.isSelectedEnergy = false
                                    viewModel.isSelectedAiFusionComplex = false
                                    viewModel.isSelectedMedicalHealth = false
                                }
                                .padding(.bottom, 28)
                            }

                            BitgouelText(
                                text: "학점",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            HStack(spacing: 16) {
                                selectButton(
                                    text: "1점",
                                    select: viewModel.isSelectedScoreOne
                                )
                                .buttonWrapper {
                                    viewModel.isSelectedScoreOne.toggle()
                                    viewModel.isSelectedScoreTwo = false
                                }

                                selectButton(
                                    text: "2점",
                                    select: viewModel.isSelectedScoreTwo
                                )
                                .buttonWrapper {
                                    viewModel.isSelectedScoreTwo.toggle()
                                    viewModel.isSelectedScoreOne = false
                                }
                            }
                        }

                        VStack(alignment: .leading, spacing: 0) {
                            BitgouelText(
                                text: "강의 계열",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            HStack {
                                PickerButton(
                                    text: viewModel.select(
                                        selectedState: viewModel.isSelectedLecture,
                                        selectText: "강의 선택",
                                        selectedName: viewModel.lectureName
                                    ),
                                    image: viewModel.chevronChange(selectedState: viewModel.isSelectedLecture)
                                ) {
                                    viewModel.isSelectedLecture = true
                                }
                                .padding(.trailing, 5.5)
                            }
                            .padding(.bottom, 28)

                            BitgouelText(
                                text: "학과",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            HStack {
                                PickerButton(
                                    text: viewModel.select(
                                        selectedState: viewModel.isSelectedSubject,
                                        selectText: "학과 선택",
                                        selectedName: viewModel.subjectName
                                    ),
                                    image: viewModel.chevronChange(selectedState: viewModel.isSelectedSubject)
                                ) {
                                    viewModel.isSelectedSubject = true
                                }
                                .padding(.trailing, 5.5)
                            }
                            .padding(.bottom, 28)

                            BitgouelText(
                                text: "담당 교수",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            HStack {
                                PickerButton(
                                    text: viewModel.select(
                                        selectedState: viewModel.isSelectedProfessor,
                                        selectText: "담당 교수 선택",
                                        selectedName: viewModel.professorName
                                    ),
                                    image: viewModel.chevronChange(selectedState: viewModel.isSelectedProfessor)
                                ) {
                                    viewModel.isSelectedProfessor = true
                                }
                                .padding(.trailing, 5.5)
                            }
                        }

                        VStack(alignment: .leading, spacing: 0) {
                            BitgouelText(
                                text: "신청 시작일",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            DatePicker(
                                "신청 시작일",
                                selection: Binding(get: {
                                    viewModel.startDatePicker
                                }, set: { newValue in
                                    viewModel.updateStartDate(date: newValue)
                                }),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.compact)
                            .environment(\.locale, Locale(identifier: "ko_KR"))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.bitgouel(.greyscale(.g9)))
                            .cornerRadius(8, corners: .allCorners)
                            .padding(.bottom, 12)

                            DatePicker(
                                "시작 시간",
                                selection: Binding(get: {
                                    viewModel.startDatePicker
                                }, set: { newValue in
                                    viewModel.updateStartDate(date: newValue)
                                }),
                                displayedComponents: [.hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.bitgouel(.greyscale(.g9)))
                            .cornerRadius(8, corners: .allCorners)
                        }

                        VStack(alignment: .leading, spacing: 0) {
                            BitgouelText(
                                text: "신청 마감일",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            DatePicker(
                                "신청 마감일",
                                selection: Binding(get: {
                                    viewModel.endDatePicker
                                }, set: { newValue in
                                    viewModel.updateEndDate(date: newValue)
                                }),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.compact)
                            .environment(\.locale, Locale(identifier: "ko_KR"))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.bitgouel(.greyscale(.g9)))
                            .cornerRadius(8, corners: .allCorners)
                            .padding(.bottom, 12)

                            DatePicker(
                                "마감 시간",
                                selection: Binding(get: {
                                    viewModel.endDatePicker
                                }, set: { newValue in
                                    viewModel.updateEndDate(date: newValue)
                                }),
                                displayedComponents: [.hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.bitgouel(.greyscale(.g9)))
                            .cornerRadius(8, corners: .allCorners)
                        }

                        VStack(alignment: .leading, spacing: 0) {
                            BitgouelText(
                                text: "강의 수강일",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            DatePicker(
                                "강의 수강일",
                                selection: Binding(get: {
                                    viewModel.openDatePicker
                                }, set: { newValue in
                                    viewModel.updateOpenDate(date: newValue)
                                }),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.compact)
                            .environment(\.locale, Locale(identifier: "ko_KR"))
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.bitgouel(.greyscale(.g9)))
                            .cornerRadius(8, corners: .allCorners)
                            .padding(.bottom, 12)

                            DatePicker(
                                "시작 시간",
                                selection: Binding(get: {
                                    viewModel.openDatePicker
                                }, set: { newValue in
                                    viewModel.updateOpenDate(date: newValue)
                                }),
                                displayedComponents: [.hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.bitgouel(.greyscale(.g9)))
                            .cornerRadius(8, corners: .allCorners)
                            .padding(.bottom, 12)

                            DatePicker(
                                "종료 시간",
                                selection: Binding(get: {
                                    viewModel.endTimePicker
                                }, set: { newValue in
                                    viewModel.updateEndTime(date: newValue)
                                }),
                                displayedComponents: [.hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(Color.bitgouel(.greyscale(.g9)))
                            .cornerRadius(8, corners: .allCorners)
                            .padding(.bottom, 20)

                            VStack(spacing: 12) {
                                ForEach(0..<viewModel.datePickerCount, id: \.self) { index in
                                    HStack(spacing: 12) {
                                        DatePicker(
                                            selection: self.viewModel.newDateSet(
                                                for: index,
                                                type: .date
                                            ),
                                            displayedComponents: .date
                                        ) {
                                            Text("강의 수강일")
                                        }
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 20)
                                        .background(Color.bitgouel(.greyscale(.g9)))
                                        .cornerRadius(8, corners: .allCorners)
                                        .environment(\.locale, Locale(identifier: "ko_KR"))
                                        
                                        Image("redcancel_fill")
                                            .buttonWrapper {
                                                if viewModel.datePickerCount > 0 {
                                                    viewModel.datePickerCount -= 1
                                                }
                                            }
                                    }

                                    DatePicker(
                                        selection: self.viewModel.newDateSet(
                                            for: index,
                                            type: .startTime
                                        ),
                                        displayedComponents: .hourAndMinute
                                    ) {
                                        Text("시작 시간")
                                    }
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 20)
                                    .background(Color.bitgouel(.greyscale(.g9)))
                                    .cornerRadius(8, corners: .allCorners)

                                    DatePicker(
                                        selection: self.viewModel.newDateSet(
                                            for: index,
                                            type: .endTime
                                        ),
                                        displayedComponents: .hourAndMinute
                                    ) {
                                        Text("종료 시간")
                                    }
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 20)
                                    .background(Color.bitgouel(.greyscale(.g9)))
                                    .cornerRadius(8, corners: .allCorners)
                                    .padding(.bottom, 8)
                                }
                            }

                            Text("+ 날짜 추가하기")
                                .bitgouelFont(.text2, color: .greyscale(.g4))
                                .padding(.vertical, 4)
                                .buttonWrapper {
                                    viewModel.datePickerCount += 1
                                    let currentDate = Date()
                                    viewModel.openDate.append(currentDate)
                                    viewModel.startTime.append(currentDate)
                                    viewModel.endTime.append(currentDate)
                                }
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            BitgouelText(
                                text: "최대 수강 인원",
                                font: .text1
                            )

                            BitgouelTextField(
                                "최대 수강 인원 입력",
                                text: $viewModel.maximumAttendance
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 28)

            if viewModel.isSelectedLecture == true {
                ZStack {
                    Color.black
                        .opacity(0.35)
                        .ignoresSafeArea()
                        .transition(.opacity)

                    ZStack {
                        VStack(alignment: .leading) {
                            HStack {
                                BitgouelText(
                                    text: "강의 계열"
                                    , font: .title2
                                )

                                Spacer()

                                BitgouelAsset.Icons.cancel.swiftUIImage
                                    .buttonWrapper { viewModel.isSelectedLecture = false }
                            }
                            .padding(.vertical, 24)

                            SearchTextField(
                                text: $viewModel.lectureName,
                                "계열 검색 또는 임의로 추가..."
                            )
                            .padding(.bottom, 16)

                            Divider()
                                .padding(.bottom, 8)
                        }
                        .padding(.horizontal, 24)
                        .background(.white)
                        .cornerRadius(8)
                        .frame(height: 720)
                    }
                    .padding(.horizontal, 28)
                }
            }

            if viewModel.isSelectedSubject == true {
                ZStack {
                    Color.black
                        .opacity(0.35)
                        .ignoresSafeArea()
                        .transition(.opacity)

                    ZStack {
                        VStack(alignment: .leading) {
                            HStack {
                                BitgouelText(
                                    text: "학과 선택",
                                    font: .title2
                                )

                                Spacer()

                                BitgouelAsset.Icons.cancel.swiftUIImage
                                    .buttonWrapper { viewModel.isSelectedSubject = false }
                            }
                            .padding(.vertical, 24)

                            SearchTextField(
                                text: $viewModel.subjectName,
                                "학과 이름으로 검색..."
                            )
                            .padding(.bottom, 16)

                            Divider()
                                .padding(.bottom, 8)
                        }
                        .padding(.horizontal, 24)
                        .background(.white)
                        .cornerRadius(8)
                        .frame(height: 720)
                    }
                    .padding(.horizontal, 28)
                }
            }

            if viewModel.isSelectedProfessor == true {
                ZStack {
                    Color.black
                        .opacity(0.35)
                        .ignoresSafeArea()
                        .transition(.opacity)

                    ZStack {
                        VStack(alignment: .leading) {
                            HStack {
                                BitgouelText(
                                    text: "담당 교수 선택",
                                    font: .title2
                                )

                                Spacer()

                                BitgouelAsset.Icons.cancel.swiftUIImage
                                    .buttonWrapper { viewModel.isSelectedProfessor = false }
                            }
                            .padding(.vertical, 24)

                            SearchTextField(
                                text: $viewModel.professorName,
                                "이름 또는 학교명으로 검색..."
                            )
                            .padding(.bottom, 16)

                            Divider()
                                .padding(.bottom, 8)
                        }
                        .padding(.horizontal, 24)
                        .background(.white)
                        .cornerRadius(8)
                        .frame(height: 720)
                    }
                    .padding(.horizontal, 28)
                }
            }
        }

        if viewModel.isSelectedLecture == false && viewModel.isSelectedSubject == false
            && viewModel.isSelectedProfessor == false {
            BitgouelButton(
                text: "적용하기"
            ) { dismiss() }
            .cornerRadius(8)
            .padding(EdgeInsets(top: 16, leading: 28, bottom: 14, trailing: 28))
        }
    }

    @ViewBuilder
    func selectButton(text: String, select: Bool) -> some View {
        Text(text)
            .bitgouelFont(.text2, color: viewModel.lectureTextColor(selectedState: select))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .overlay {
                RoundedRectangle(cornerRadius: 99)
                    .stroke(viewModel.lectureStrokeColor(selectedState: select))
            }
            .background(viewModel.lectureBackgroundColor(selectedState: select))
            .cornerRadius(99)
    }
}
