import SwiftUI

struct StudentSignUpView: View {
    @StateObject var viewModel: StudentSignUpViewModel
    @StateObject var commonViewModel: CommonSignUpViewModel
    @State var isSchool = false
    @State var isShowingClubSelectSheet = false
    @State var isShowingSuccessView = false

    var body: some View {
        NavigationView {
            ScrollView {
                signupTitleSection()

                VStack(spacing: 16) {
                    switch viewModel.userRole {
                    case .student:
                        ConditionView(!viewModel.studentID.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(!viewModel.name.isEmpty) {
                            inputStudentInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != "동아리") {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != "학교") {
                            inputClubSection()
                        }
                    case .teacher, .bbozzack:
                        ConditionView(!viewModel.name.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != "동아리") {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != "학교") {
                            inputClubSection()
                        }
                    case .companyInstructor:
                        ConditionView(!viewModel.selectedCompany.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(!viewModel.name.isEmpty) {
                            inputCompanyInstructorInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != "동아리") {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != "학교") {
                            inputClubSection()
                        }
                    case .professor:
                        ConditionView(!viewModel.selectedUniversity.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(!viewModel.name.isEmpty) {
                            inputProfessorInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != "동아리") {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != "학교") {
                            inputClubSection()
                        }
                    case .government:
                        ConditionView(!viewModel.selectedGovernment.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(!viewModel.name.isEmpty) {
                            inputGovernmentInfoSection()
                        }

                        ConditionView(viewModel.selectedSchool != "학교") {
                            inputNameSection()
                        }
                    }

                    inputSchoolInfoSection()

                    Spacer()
                }
                .padding(.horizontal, 28)
                .padding(.top, 32)
            }
        }
        .bitgouelBottomSheet(
            isShowing: $isSchool
        ) {
            SchoolListView(viewModel: viewModel)
                .frame(height: 415)
        }

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
        .background(
            NavigationLink(
                destination: SuccessSignUpView(),
                isActive: $isShowingSuccessView,
                label: { EmptyView() }
            )
        )

        .navigationBarHidden(true)
    }

    @ViewBuilder
    func signupTitleSection() -> some View {
        VStack {
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
        }
    }

    @ViewBuilder
    func inputAuthorizationInfoSection() -> some View {
        VStack(spacing: 16) {
            Group {
                if !viewModel.password.isEmpty {
                    SecureBitgouelTextField(
                        "비밀번호",
                        text: $viewModel.checkPassword
                    )
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
                        text: $viewModel.password
                    )
                    .padding(.bottom, -20)
                }
            }

            Group {
                if !viewModel.email.isEmpty {
                    BitgouelTextField(
                        "인증번호",
                        text: $viewModel.certificationNumberEmail,
                        helpMessage: viewModel.convertSecondsToTime(timeInSeconds: viewModel.emailTimeRemaining),
                        link: "재발송"
                    )
                }

                if !viewModel.certificationNumberPhoneNumber.isEmpty {
                    BitgouelTextField(
                        "이메일",
                        text: $viewModel.email,
                        helpMessage: viewModel.emailHelpMessage,
                        isError: viewModel.isEmailErrorOccured
                    )
                    .onChange(of: viewModel.emailHelpMessage) { newValue in }
                    .textContentType(.emailAddress)
                }
            }
            Group {
                if !viewModel.phoneNumber.isEmpty {
                    BitgouelTextField(
                        "인증번호",
                        text: $viewModel.certificationNumberPhoneNumber,
                        helpMessage: viewModel.convertSecondsToTime(timeInSeconds: viewModel.phoneNumberTimeRemaining),
                        link: "재발송"
                    )
                }

                BitgouelTextField(
                    "전화번호",
                    text: $viewModel.phoneNumber
                )
                .onChange(of: viewModel.phoneNumber) { newValue in
                    if !viewModel.phoneNumber.isEmpty {
                        viewModel.phoneNumberStartTimer()
                    }
                }
                .padding(.bottom, -20)
            }
        }
    }

    @ViewBuilder
    func inputSchoolInfoSection() -> some View {
        VStack(spacing: 16) {
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
    func inputClubSection() -> some View {
        VStack(spacing: 0) {
            AssociationSelectButton(
                text: viewModel.selectedClub
            ) {
                isShowingClubSelectSheet.toggle()
            }
        }
    }

    @ViewBuilder
    func inputNameSection() -> some View {
        VStack(spacing: 0) {
            BitgouelTextField(
                "이름",
                text: $viewModel.name
            )
            .padding(.bottom, -20)
        }
    }

    // MARK: Student
    @ViewBuilder
    func inputStudentInfoSection() -> some View {
        VStack(spacing: 16) {
            if !viewModel.yearOfAdmission.isEmpty {
                BitgouelTextField(
                    "학번",
                    text: $viewModel.studentID
                )
                .padding(.bottom, -20)
            }

            BitgouelTextField(
                "입학년도",
                text: $viewModel.yearOfAdmission
            )
            .padding(.bottom, -20)
        }
    }

    // MARK: Professor
    @ViewBuilder
    func inputProfessorInfoSection() -> some View {
        VStack(spacing: 0) {
            BitgouelTextField(
                "소속 대학명",
                text: $viewModel.selectedUniversity
            )
            .padding(.bottom, -20)
        }
    }

    // MARK: Government
    @ViewBuilder
    func inputGovernmentInfoSection() -> some View {
        VStack(spacing: 0) {
            BitgouelTextField(
                "소속 기관명",
                text: $viewModel.selectedGovernment
            )
            .padding(.bottom, -20)
        }
    }

    // MARK: CompanyInstructor
    @ViewBuilder
    func inputCompanyInstructorInfoSection() -> some View {
        VStack(spacing: 0) {
            BitgouelTextField(
                "소속 기업명",
                text: $viewModel.selectedCompany
            )
            .padding(.bottom, -20)
        }
    }
}
