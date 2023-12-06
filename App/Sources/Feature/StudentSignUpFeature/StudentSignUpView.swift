import SwiftUI

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
        case university
        case government
        case company
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: StudentSignUpViewModel
    @StateObject var commonViewModel: CommonSignUpViewModel
    @State var isSchool = false
    @State var isShowingClubSelectSheet = false
    @State var isShowingSuccessView = false

    var body: some View {
        NavigationView {
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

                    enterInformation()
                        .padding(.top, 32)
                        .padding(.horizontal, 28)

                    Spacer()
                }
            }
            .bitgouelBottomSheet(
                isShowing: $isSchool
            ) {
                SchoolListView(viewModel: viewModel)
                    .frame(height: 415)
            }
            .background(
                NavigationLink(
                    destination: SuccessSignUpView(),
                    isActive: $isShowingSuccessView,
                    label: { EmptyView() }
                )
            )
        }
        .navigationBarHidden(true)
    }

    @ViewBuilder
    func inputAuthorizationInformationView() -> some View {
        VStack(spacing: 16) {
            Group {
                if !viewModel.password.isEmpty {
                    SecureBitgouelTextField(
                        "비밀번호",
                        text: $viewModel.checkPassword
                    )
                    .focused($focusField, equals: .checkPassword)
                    .padding(.bottom, -20)
                    .onSubmit {
                        if viewModel.isPasswordMatching {
                            isShowingSuccessView = true
                        } else {
                            isShowingSuccessView = false
                        }
                    }
                }

                if !viewModel.certificationNumberEmail.isEmpty {
                    SecureBitgouelTextField(
                        "비밀번호",
                        text: $viewModel.password,
                        onSubmit: {
                            focusField = .checkPassword
                        }
                    )
                    .focused($focusField, equals: .password)
                    .padding(.bottom, -20)
                }
            }

            Group {
                if !viewModel.email.isEmpty {
                    BitgouelTextField(
                        "인증번호",
                        text: $viewModel.certificationNumberEmail,
                        helpMessage: viewModel.convertSecondsToTime(timeInSeconds: viewModel.emailTimeRemaining),
                        link: "재발송",
                        onSubmit: {
                            focusField = .password
                        }
                    )
                    .focused($focusField, equals: .certificationEmail)
                }

                if !viewModel.certificationNumberPhoneNumber.isEmpty {
                    BitgouelTextField(
                        "이메일",
                        text: $viewModel.email,
                        helpMessage: viewModel.emailHelpMessage,
                        isError: viewModel.isEmailErrorOccured,
                        onSubmit: {
                            focusField = .certificationEmail
                        }
                    )
                    .onChange(of: viewModel.emailHelpMessage) { newValue in }
                    .focused($focusField, equals: .email)
                    .textContentType(.emailAddress)
                }
            }
            Group {
                if !viewModel.phoneNumber.isEmpty {
                    BitgouelTextField(
                        "인증번호",
                        text: $viewModel.certificationNumberPhoneNumber,
                        helpMessage: viewModel.convertSecondsToTime(timeInSeconds: viewModel.phoneNumberTimeRemaining),
                        link: "재발송",
                        onSubmit: {
                            focusField = .email
                        }
                    )
                    .focused($focusField, equals: .certificationNumberPhoneNumber)
                }

                if !viewModel.studentID.isEmpty {
                    BitgouelTextField(
                        "전화번호",
                        text: $viewModel.phoneNumber,
                        onSubmit: {
                            focusField = .certificationNumberPhoneNumber
                        }
                    )
                    .onChange(of: viewModel.phoneNumber) { newValue in
                        if !viewModel.phoneNumber.isEmpty {
                            viewModel.phoneNumberStartTimer()
                        }
                    }
                    .focused($focusField, equals: .phoneNumber)
                    .padding(.bottom, -20)
                }
            }
        }
    }

    @ViewBuilder
    func enterInformation() -> some View {
        VStack(spacing: 16) {
            if viewModel.selectedSchoolExists {
                AssociationSelectButton(
                    text: viewModel.selectedClub
                ) {
                    isShowingClubSelectSheet.toggle()
                }
            }

            AssociationSelectButton(
                text: viewModel.selectedSchool
            ) {
                isSchool.toggle()
            }

            AssociationSelectButton(text: "학교")

            AssociationSelectButton(text: "학생")
        }
    }

    @ViewBuilder
    func inputName() -> some View {
        VStack(spacing: 16) {
            if viewModel.selectedClubExists {
                BitgouelTextField(
                    "이름",
                    text: $viewModel.name,
                    onSubmit: {
                        focusField = .yearOfAdmission
                    }
                )
                .focused($focusField, equals: .name)
                .padding(.bottom, -20)
            }
        }
    }

    @ViewBuilder
    func inputClubInfoView() -> some View {
        VStack(spacing: 16) {
            ScrollView {}
                .bitgouelBottomSheet(
                    isShowing: $isShowingClubSelectSheet
                ) {
                    ClubListView(
                        searchText: $viewModel.clubSearch,
                        searchedClubList: viewModel.searchedClubList,
                        selectedClub: viewModel.selectedClub,
                        clubDidSelect: { selectedClub in
                            viewModel.selectedClub = selectedClub
                        }
                    )
                    .frame(height: 415)
                }
        }
    }

    // MARK: Student
    @ViewBuilder
    func inputStudentInfoView() -> some View {
        VStack(spacing: 16) {
            if !viewModel.yearOfAdmission.isEmpty {
                BitgouelTextField(
                    "학번",
                    text: $viewModel.studentID,
                    onSubmit: {
                        focusField = .phoneNumber
                    }
                )
                .focused($focusField, equals: .studentID)
                .padding(.bottom, -20)
            }

            if !viewModel.name.isEmpty {
                BitgouelTextField(
                    "입학년도",
                    text: $viewModel.yearOfAdmission,
                    onSubmit: {
                        focusField = .studentID
                    }
                )
                .focused($focusField, equals: .yearOfAdmission)
                .padding(.bottom, -20)
            }
        }
    }

    // MARK: Professor
    @ViewBuilder
    func inputProfessorInfoView() -> some View {
        VStack(spacing: 16) {
            if !viewModel.name.isEmpty {
                BitgouelTextField(
                    "소속 대학명",
                    text: $viewModel.selectedUniversity,
                    onSubmit: {
                        focusField = .phoneNumber
                    }
                )
                .focused($focusField, equals: .university)
                .padding(.bottom, -20)
            }
        }
    }

    // MARK: Government
    @ViewBuilder
    func inputGovernmentInfoView() -> some View {
        VStack(spacing: 16) {
            if !viewModel.name.isEmpty {
                BitgouelTextField(
                    "소속 기관명",
                    text: $viewModel.selectedGovernment,
                    onSubmit: {
                        focusField = .phoneNumber
                    }
                )
                .focused($focusField, equals: .government)
                .padding(.bottom, -20)
            }
        }
    }
    
    // MARK: CompanyInstructor
    @ViewBuilder
    func inputCompanyInstructorInfoView() -> some View {
        VStack(spacing: 16) {
            if !viewModel.name.isEmpty {
                BitgouelTextField(
                    "소속 기업명",
                    text: $viewModel.selectedCompany,
                    onSubmit: {
                        focusField = .phoneNumber
                    }
                )
                .focused($focusField, equals: .company)
                .padding(.bottom, -20)
            }
        }
    }
}
