import SwiftUI
import Service

struct LectureDetailSettingView: View {
    @StateObject var viewModel: LectureDetailSettingViewModel
    @Environment(\.dismiss) var dismiss

    private let lectureOpenApplyFactory: any LectureOpenApplyFactory
    
    init(
        viewModel: LectureDetailSettingViewModel,
        lectureOpenApplyFactory: any LectureOpenApplyFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.lectureOpenApplyFactory = lectureOpenApplyFactory
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
                            BitgouelText(
                                text: "강의 유형",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            selectButton(
                                text: "상호학점인정교육과정",
                                select: viewModel.lectureType1
                            )
                            .buttonWrapper {
                                viewModel.lectureType1.toggle()
                                viewModel.lectureType2 = false
                            }
                            .padding(.bottom, 16)

                            selectButton(
                                text: "대학탐방프로그램",
                                select: viewModel.lectureType2
                            )
                            .buttonWrapper {
                                viewModel.lectureType2.toggle()
                                viewModel.lectureType1 = false
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
                                    select: viewModel.gradeOneSemesterTwo
                                )
                                .buttonWrapper {
                                    viewModel.gradeOneSemesterTwo.toggle()
                                    viewModel.gradeThreeSemesterOne = false
                                    viewModel.gradeTwoSemesterOne = false
                                    viewModel.gradeTwoSemesterTwo = false
                                }

                                selectButton(
                                    text: "2학년 1학기",
                                    select: viewModel.gradeTwoSemesterOne
                                )
                                .buttonWrapper {
                                    viewModel.gradeTwoSemesterOne.toggle()
                                    viewModel.gradeOneSemesterTwo = false
                                    viewModel.gradeThreeSemesterOne = false
                                    viewModel.gradeTwoSemesterTwo = false
                                }
                            }
                            .padding(.bottom, 16)

                            HStack(spacing: 16) {
                                selectButton(
                                    text: "2학년 2학기",
                                    select: viewModel.gradeTwoSemesterTwo
                                )
                                .buttonWrapper {
                                    viewModel.gradeTwoSemesterTwo.toggle()
                                    viewModel.gradeOneSemesterTwo = false
                                    viewModel.gradeThreeSemesterOne = false
                                    viewModel.gradeTwoSemesterOne = false
                                }

                                selectButton(
                                    text: "3학년 1학기",
                                    select: viewModel.gradeThreeSemesterOne
                                )
                                .buttonWrapper {
                                    viewModel.gradeThreeSemesterOne.toggle()
                                    viewModel.gradeOneSemesterTwo = false
                                    viewModel.gradeTwoSemesterOne = false
                                    viewModel.gradeTwoSemesterTwo = false
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
                                    select: viewModel.automobile
                                )
                                .buttonWrapper {
                                    viewModel.automobile.toggle()
                                    viewModel.culture = false
                                    viewModel.energy = false
                                    viewModel.aiFusionComplex = false
                                    viewModel.medicalHealth = false
                                }

                                selectButton(
                                    text: "에너지 산업",
                                    select: viewModel.energy
                                )
                                .buttonWrapper {
                                    viewModel.energy.toggle()
                                    viewModel.automobile = false
                                    viewModel.culture = false
                                    viewModel.aiFusionComplex = false
                                    viewModel.medicalHealth = false
                                }
                            }
                            .padding(.bottom, 16)

                            HStack(spacing: 16) {
                                selectButton(
                                    text: "의료•헬스",
                                    select: viewModel.medicalHealth
                                )
                                .buttonWrapper {
                                    viewModel.medicalHealth.toggle()
                                    viewModel.automobile = false
                                    viewModel.culture = false
                                    viewModel.energy = false
                                    viewModel.aiFusionComplex = false
                                }

                                selectButton(
                                    text: "AI 융•복합",
                                    select: viewModel.aiFusionComplex
                                )
                                .buttonWrapper {
                                    viewModel.aiFusionComplex.toggle()
                                    viewModel.automobile = false
                                    viewModel.culture = false
                                    viewModel.energy = false
                                    viewModel.medicalHealth = false
                                }
                            }
                            .padding(.bottom, 16)

                            selectButton(
                                text: "문화 산업",
                                select: viewModel.culture
                            )
                            .buttonWrapper {
                                viewModel.culture.toggle()
                                viewModel.automobile = false
                                viewModel.energy = false
                                viewModel.aiFusionComplex = false
                                viewModel.medicalHealth = false
                            }
                            .padding(.bottom, 28)

                            BitgouelText(
                                text: "학점",
                                font: .text1
                            )
                            .padding(.bottom, 8)

                            HStack(spacing: 16) {
                                selectButton(
                                    text: "1점",
                                    select: viewModel.scoreOne
                                )
                                .buttonWrapper {
                                    viewModel.scoreOne.toggle()
                                    viewModel.scoreTwo = false
                                }

                                selectButton(
                                    text: "2점",
                                    select: viewModel.scoreTwo
                                )
                                .buttonWrapper {
                                    viewModel.scoreTwo.toggle()
                                    viewModel.scoreOne = false
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
                                        parameter: viewModel.lecture,
                                        parameterChoice: "강의 선택",
                                        parameterName: viewModel.lectureName
                                    ),
                                    image: viewModel.chevronChange(parameter: viewModel.lecture)
                                ) {
                                    viewModel.lecture = true
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
                                        parameter: viewModel.subject,
                                        parameterChoice: "학과 선택",
                                        parameterName: viewModel.subjectName
                                    ),
                                    image: viewModel.chevronChange(parameter: viewModel.subject)
                                ) {
                                    viewModel.subject = true
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
                                        parameter: viewModel.professor,
                                        parameterChoice: "담당 교수 선택",
                                        parameterName: viewModel.professorName
                                    ),
                                    image: viewModel.chevronChange(parameter: viewModel.professor)
                                ) {
                                    viewModel.professor = true
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
                                    viewModel.startPicker
                                }, set: { newValue in
                                    viewModel.startUpdateDate(date: newValue)
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
                                    viewModel.startPicker
                                }, set: { newValue in
                                    viewModel.startUpdateDate(date: newValue)
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
                                    viewModel.endPicker
                                }, set: { newValue in
                                    viewModel.endUpdateDate(date: newValue)
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
                                    viewModel.endPicker
                                }, set: { newValue in
                                    viewModel.endUpdateDate(date: newValue)
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
                                    viewModel.openPicker
                                }, set: { newValue in
                                    viewModel.openUpdateDate(date: newValue)
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
                                    viewModel.openPicker
                                }, set: { newValue in
                                    viewModel.openUpdateDate(date: newValue)
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
                                    viewModel.openPicker2
                                }, set: { newValue in
                                    viewModel.openUpdateDate2(date: newValue)
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
                                            selection: self.viewModel.binding(
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
                                        
                                        BitgouelAsset.Icons.redCancelFill.swiftUIImage
                                            .buttonWrapper {
                                                if viewModel.datePickerCount > 0 {
                                                    viewModel.datePickerCount -= 1
                                                }
                                            }
                                    }

                                    DatePicker(
                                        selection: self.viewModel.binding(
                                            for: index,
                                            type: .time1
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
                                        selection: self.viewModel.binding(
                                            for: index,
                                            type: .time2
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

            if viewModel.lecture == true {
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
                                    .buttonWrapper { viewModel.lecture = false }
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

            if viewModel.subject == true {
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
                                    .buttonWrapper { viewModel.subject = false }
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

            if viewModel.professor == true {
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
                                    .buttonWrapper { viewModel.professor = false }
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

        if viewModel.lecture == false && viewModel.subject == false
            && viewModel.professor == false {
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
            .bitgouelFont(.text2, color: viewModel.lectureTextColor(parameter: select))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .overlay {
                RoundedRectangle(cornerRadius: 99)
                    .stroke(viewModel.lectureStrokeColor(parameter: select))
            }
            .background(viewModel.lectureBackgroundColor(parameter: select))
            .cornerRadius(99)
    }
}
