import SwiftUI
import Service

struct LectureDetailSettingsView: View {
    @State var ismutualCreditRecognitionProgram: Bool = false
    @StateObject var viewModel: LectureOpeningApplyViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Text("강의 세부 설정")
                        .bitgouelFont(.title3)
                    
                    Spacer()
                    
                    Image("cancel")
                        .buttonWrapper { dismiss() }
                }
                .padding(.vertical, 24)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 28) {
                        
                        HStack {
                            Text("강의 유형")
                                .bitgouelFont(.text1)
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("상호학점인정교육과정")
                                .bitgouelFont(.text2, color: viewModel.lectureTypeText1)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 99)
                                        .stroke(viewModel.lectureTypeStroke1)
                                }
                                .background(viewModel.lectureTypeBackground1)
                                .cornerRadius(99)
                                .buttonWrapper {
                                    viewModel.lectureType1.toggle()
                                    viewModel.lectureType2 = false
                                }
                            
                            Text("대학탐방프로그램")
                                .bitgouelFont(.text2, color: viewModel.lectureTypeText2)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 99)
                                        .stroke(viewModel.lectureTypeStroke2)
                                }
                                .background(viewModel.lectureTypeBackground2)
                                .cornerRadius(99)
                                .buttonWrapper {
                                    viewModel.lectureType2.toggle()
                                    viewModel.lectureType1 = false
                                }
                        }
                        
                        HStack {
                            Text("강의 계열")
                                .bitgouelFont(.text1)
                        }
                        
                        LectureLineView(viewModel: LectureOpeningApplyViewModel())
                        
                        VStack {
                            HStack {
                                Text("신청 시작일")
                                    .bitgouelFont(.text1)
                                
                                Spacer()
                            }
                            .padding(.bottom, 8)
                            
                            HStack {
                                PickerButton(
                                    text: viewModel.formattedStartDate,
                                    image: viewModel.chevronChange
                                ) {
                                    viewModel.startDateSheet.toggle()
                                    viewModel.startDate = true
                                }
                                .padding(.trailing, 5.5)
                                
                                PickerButton(
                                    text: viewModel.formattedStartTime,
                                    image: viewModel.chevronChange2
                                ) {
                                    viewModel.startTimeSheet.toggle()
                                    viewModel.startTime = true
                                }
                                .padding(.leading, 5.5)
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("신청 마감일")
                                    .bitgouelFont(.text1)
                                
                                Spacer()
                            }
                            .padding(.bottom, 8)
                            
                            HStack {
                                PickerButton(
                                    text: viewModel.formattedEndDate,
                                    image: viewModel.chevronChange3
                                ) {
                                    viewModel.endDateSheet.toggle()
                                    viewModel.endDate = true
                                }
                                .padding(.trailing, 5.5)
                                
                                PickerButton(
                                    text: viewModel.formattedEndTime,
                                    image: viewModel.chevronChange4
                                ) {
                                    viewModel.endTimeSheet.toggle()
                                    viewModel.endTime = true
                                }
                                .padding(.leading, 5.5)
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("개강일")
                                    .bitgouelFont(.text1)
                                
                                Spacer()
                            }
                            .padding(.bottom, 8)
                            
                            HStack {
                                PickerButton(
                                    text: viewModel.formattedOpenDate,
                                    image: viewModel.chevronChange5
                                ) {
                                    viewModel.openDateSheet.toggle()
                                    viewModel.openDate = true
                                }
                                .padding(.trailing, 5.5)
                                
                                PickerButton(
                                    text: viewModel.formattedOpenTime,
                                    image: viewModel.chevronChange6
                                ) {
                                    viewModel.openTimeSheet.toggle()
                                    viewModel.openTime = true
                                }
                                .padding(.leading, 5.5)
                            }
                        }
                        
                        if viewModel.lectureType1 == true {
                            VStack {
                                HStack {
                                    Text("수여 학점")
                                        .bitgouelFont(.text1)
                                    
                                    Spacer()
                                }
                                .padding(.bottom, 8)
                                
                                PickerButton(
                                    text: viewModel.giveScore,
                                    image: viewModel.chevronChange7
                                ) {
                                    viewModel.scoreSheet.toggle()
                                }
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("최대 수강 인원")
                                    .bitgouelFont(.text1)
                                
                                Spacer()
                            }
                            .padding(.bottom, 8)
                            
                            BitgouelTextField(
                                "최대 수강 인원 입력",
                                text: $viewModel.maximumAttendance
                            )
                            
                            HStack {
                                Text("담당 교수")
                                    .bitgouelFont(.text1)
                                
                                Spacer()
                            }
                            .padding(.bottom, 8)
                            
                            HStack {
                                PickerButton(
                                    text: viewModel.formattedProfessorChoice,
                                    image: viewModel.chevronChange8
                                ) {
                                    viewModel.professor = true
                                }
                                .padding(.trailing, 5.5)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 28)
            
            .bitgouelBottomSheet(
                isShowing: $viewModel.startTimeSheet,
                cornerRadius: 8
            ) {
                DatePicker(
                    "Please enter a date",
                    selection: $viewModel.startPicker,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            }
            
            .bitgouelBottomSheet(
                isShowing: $viewModel.startDateSheet,
                cornerRadius: 8
            ) {
                DatePicker(
                    "Please enter a date",
                    selection: $viewModel.startPicker,
                    displayedComponents: .date
                )
                .frame(width: 320)
                .datePickerStyle(.graphical)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ko_KR"))
            }
            
            .bitgouelBottomSheet(
                isShowing: $viewModel.endTimeSheet,
                cornerRadius: 8
            ) {
                DatePicker(
                    "Please enter a date",
                    selection: $viewModel.endPicker,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            }
            
            .bitgouelBottomSheet(
                isShowing: $viewModel.endDateSheet,
                cornerRadius: 8
            ) {
                DatePicker(
                    "Please enter a date",
                    selection: $viewModel.endPicker,
                    displayedComponents: .date
                )
                .frame(width: 320)
                .datePickerStyle(.graphical)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ko_KR"))
            }
            
            .bitgouelBottomSheet(
                isShowing: $viewModel.openTimeSheet,
                cornerRadius: 8
            ) {
                DatePicker(
                    "Please enter a date",
                    selection: $viewModel.openPicker,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            }
            
            .bitgouelBottomSheet(
                isShowing: $viewModel.openDateSheet,
                cornerRadius: 8
            ) {
                DatePicker(
                    "Please enter a date",
                    selection: $viewModel.openPicker,
                    displayedComponents: .date
                )
                .frame(width: 320)
                .datePickerStyle(.graphical)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ko_KR"))
            }
            
            .bitgouelBottomSheet(
                isShowing: $viewModel.scoreSheet,
                cornerRadius: 8
            ) {
                ForEach(viewModel.scoreValue, id: \.self) { score in
                    VStack {
                        HStack {
                            BitgouelText(
                                text: "\(score)점",
                                font: .text2
                            )
                            
                            Spacer()
                            
                            BitgouelRadioButton(
                                isSelected: Binding(
                                    get: { viewModel.score == score },
                                    set: { isSelected in
                                        if isSelected {
                                            viewModel.scoreSheet = false
                                            viewModel.score = score
                                        }
                                    }
                                )
                            )
                        }
                        .onTapGesture {
                            viewModel.scoreSheet = false
                            viewModel.score = score
                        }
                        .padding(.horizontal, 28)
                        .padding(.vertical, 24)
                    }
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
                                Text("담당 교수 선택")
                                    .bitgouelFont(.title2)
                                
                                Spacer()
                                
                                Image("cancel")
                                    .buttonWrapper { viewModel.professor = false }
                            }
                            .padding(.vertical, 24)
                            
                            BitgouelTextField(
                                "이름 또는 학교명으로 검색",
                                text: $viewModel.professorName
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
        
        if viewModel.startTimeSheet == false && viewModel.endTimeSheet == false
            && viewModel.openTimeSheet == false && viewModel.startDateSheet == false
            && viewModel.endDateSheet == false && viewModel.openDateSheet == false
            && viewModel.scoreSheet == false && viewModel.professor == false {
            BitgouelButton(text: "적용하기")
                .cornerRadius(8)
                .padding(EdgeInsets(top: 16, leading: 28, bottom: 14, trailing: 28))
        }
    }
}
