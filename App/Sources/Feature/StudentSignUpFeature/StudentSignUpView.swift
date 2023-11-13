import SwiftUI
import Combine

struct StudentSignUpView: View {
    private enum FocusField {
        case name
        case yearOfAdmission
        case studentID
        case phoneNumber
        case certificationNumberPhoneNumber
        case email
        case certificationEmail
        case password
        case checkPassword
    }
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: StudentSignUpViewModel
    @State var isSchool = false
    @State var isClub = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.titleMessage)
                            .bitgouelFont(.title2)
                        
                        Text(viewModel.subTitleMessage)
                            .bitgouelFont(.text3, color: .greyscale(.g4))
                    }
                    
                    Spacer()
                }
                .padding(.leading, 28)
                .padding(.top, 24)
                
                VStack(spacing: 16) {
                    if !viewModel.password.isEmpty {
                        SecureBitgouelTextField(
                            "비밀번호",
                            text: $viewModel.checkPassword
                        )
                        .focused($focusField, equals: .checkPassword)
                        .padding(.bottom, -20)
                    }
                    
                    if !viewModel.certificationNumberEmail.isEmpty {
                        SecureBitgouelTextField(
                            "비밀번호",
                            text: $viewModel.password
                        ) {
                            focusField = .checkPassword
                        }
                        .focused($focusField, equals: .password)
                        .padding(.bottom, -20)
                    }
                    
                    if !viewModel.email.isEmpty {
                        BitgouelTextField(
                            "인증번호",
                            text: $viewModel.certificationNumberEmail,
                            helpMessage: viewModel.convertSecondsToTime(timeInSeconds: viewModel.emailTimeRemaining),
                            link: "재발송"
                        ) {
                            focusField = .password
                        }
                        .focused($focusField, equals: .certificationEmail)
                    }
                    
                    if !viewModel.certificationNumberPhoneNumber.isEmpty {
                        BitgouelTextField(
                            "이메일",
                            text: $viewModel.email,
                            helpMessage: viewModel.emailHelpMessage,
                            isError: viewModel.isEmailErrorOccured
                        ) {
                            focusField = .certificationEmail
                        }
                        .onChange(of: viewModel.emailHelpMessage) { newValue in }
                        .focused($focusField, equals: .email)
                        .textContentType(.emailAddress)
                        .padding(.bottom, -20)
                    }
                    
                    if !viewModel.phoneNumber.isEmpty {
                        BitgouelTextField(
                            "인증번호",
                            text: $viewModel.certificationNumberPhoneNumber,
                            helpMessage: viewModel.convertSecondsToTime(timeInSeconds: viewModel.phoneNumberTimeRemaining),
                            link: "재발송"
                        ) {
                            focusField = .email
                        }
                        .focused($focusField, equals: .certificationNumberPhoneNumber)
                    }
                    
                    if !viewModel.studentID.isEmpty {
                        BitgouelTextField(
                            "전화번호",
                            text: $viewModel.phoneNumber
                        ) {
                            focusField = .certificationNumberPhoneNumber
                        }
                        .onChange(of: viewModel.phoneNumber) { newValue in
                            if !viewModel.phoneNumber.isEmpty {
                                viewModel.phoneNumberStartTimer()
                            }
                        }
                        .focused($focusField, equals: .phoneNumber)
                        .padding(.bottom, -20)
                    }
                    
                    if !viewModel.yearOfAdmission.isEmpty {
                        BitgouelTextField(
                            "학번",
                            text: $viewModel.studentID
                        ) {
                            focusField = .phoneNumber
                        }
                        .focused($focusField, equals: .studentID)
                        .padding(.bottom, -20)
                    }
                    
                    if !viewModel.name.isEmpty {
                        BitgouelTextField(
                            "입학년도",
                            text: $viewModel.yearOfAdmission
                        ) {
                            focusField = .studentID
                        }
                        .focused($focusField, equals: .yearOfAdmission)
                        .padding(.bottom, -20)
                    }
                    
                    if viewModel.isClubEmpty {
                        BitgouelTextField(
                            "이름",
                            text: $viewModel.name
                        ) {
                            focusField = .yearOfAdmission
                        }
                        .focused($focusField, equals: .name)
                        .padding(.bottom, -20)
                    }
                    
                    if viewModel.isSchoolEmpty {
                        AssociationSelectButton(
                            text: viewModel.clubResult
                        ) {
                            isClub.toggle()
                        }
                    }
                    
                    AssociationSelectButton(
                        text: viewModel.schoolResult
                    ) {
                        isSchool.toggle()
                    }
                    
                    AssociationSelectButton(
                        text: "학생"
                    )
                    
                    AssociationSelectButton(
                        text: "학교"
                    )
                }
                .padding(.top, 32)
                .padding(.horizontal, 28)
                
                Spacer()
            }
        }
            .bitgouelBottomSheet(
                isShowing: $isSchool
            ) {
                schoolListView()
                    .frame(height: 415)
            }
            .bitgouelBottomSheet(
                isShowing: $isClub
            ) {
                clubListView()
                    .frame(height: 415)
            }
        }
    
    @ViewBuilder
    func schoolListView() -> some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "학교 이름으로 검색",
                text: $viewModel.school
            )
            .padding(.horizontal, 28)
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchSchool, id: \.self) { school in
                        HStack {
                            Text(school.display())
                                .frame(height: 73)
                            
                         Spacer()
                            
                            BitgouelRadioButton(
                                isSelected: Binding(
                                    get: { viewModel.schoolResult == school.display() },
                                    set: { highSchool in
                                        if highSchool {
                                            viewModel.schoolResult = school.display()
                                            viewModel.getClubsForSelectedHighSchool = school
                                        }
                                        
                                    }
                                ))
                        }
                        .padding(.horizontal, 28)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func clubListView() -> some View {
        VStack(spacing: 8) {
            BitgouelTextField(
                "동아리 이름으로 검색",
                text: $viewModel.club
            )
            .padding(.horizontal, 28)
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchClub, id: \.self) { club in
                        HStack {
                            Text(club)
                                .frame(height: 73)
                            
                            Spacer()
                            
                            BitgouelRadioButton(
                                isSelected: Binding(
                                    get: { viewModel.clubResult == club },
                                    set: { careerClub in
                                        if careerClub {
                                            viewModel.clubResult = club
                                        }
                                    }
                                ))
                        }
                        .padding(.horizontal, 28)
                    }
                }
            }
        }
    }
}

#Preview {
    StudentSignUpView(viewModel: StudentSignUpViewModel())
}
