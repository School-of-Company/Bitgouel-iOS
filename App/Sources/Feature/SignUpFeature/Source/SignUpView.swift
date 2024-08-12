import Service
import SwiftUI

// swiftlint: disable type_body_length
struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var scenceState: SceneState
    @StateObject var viewModel: SignUpViewModel

    private let successSignUpFactory: any SuccessSignUpFactory

    init(
        viewModel: SignUpViewModel,
        successSignUpFactory: any SuccessSignUpFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.successSignUpFactory = successSignUpFactory
    }

    var body: some View {
        NavigationView {
            ScrollView {
                signupTitleSection()

                VStack {
                    switch viewModel.selectedUserRole {
                    case .student:
                        if viewModel.studentInfo?.number != nil {
                            inputAuthorizationInfoSection()
                        }

                        if !viewModel.userInfo.name.isEmpty {
                            inputStudentInfoSection()
                        }

                    case .teacher, .bbozzack:
                        if !viewModel.userInfo.name.isEmpty {
                            inputAuthorizationInfoSection()
                        }

                    case .companyInstructor:
                        if !viewModel.selectedCompany.isEmpty {
                            inputAuthorizationInfoSection()
                        }

                        if !viewModel.userInfo.name.isEmpty {
                            PickerTextField(
                                "소속 기업명",
                                text: viewModel.selectedCompany
                            ) {
                                viewModel.updateIsShowingCompanyBottomSheet(isShowing: true)
                            }
                        }

                    case .professor:
                        if !viewModel.selectedUniversity.isEmpty {
                            inputAuthorizationInfoSection()
                        }

                        if !viewModel.userInfo.name.isEmpty {
                            PickerTextField(
                                "소속 대학명",
                                text: viewModel.selectedUniversity
                            ) {
                                viewModel.updateIsShowingUniversityBottomSheet(isShowing: true)
                            }
                        }

                    case .government:
                        if !viewModel.governmentInfo.position.isEmpty {
                            inputAuthorizationInfoSection()
                        }

                        if !viewModel.userInfo.name.isEmpty {
                            inputGovernmentInfoSection()
                        }

                    default:
                        EmptyView()
                    }

                    inputGeneralInfoSection()
                }
                .padding(.top, 32)
                .padding(.horizontal, 28)
            }
            .overlay(alignment: .bottom) {
                if !viewModel.checkPassword.isEmpty {
                    signupApplyButton()
                        .padding(.horizontal, 28)
                }
            }
            .onAppear {
                viewModel.fetchSchoolList()
                viewModel.fetchClubList()
                viewModel.fetchCompanyList()
                viewModel.fetchUniversityList()
                viewModel.fetchGovernmentList()
            }
            .bitgouelToast(
                text: viewModel.errorMessage,
                isShowing: $viewModel.isErrorOccurred
            )
            .bitgouelBottomSheet(isShowing: $viewModel.isShowingSchoolBottomSheet) {
                SearchSchoolListBottomSheet(
                    schoolList: viewModel.schoolList,
                    selectedSchool: viewModel.userInfo.highschool
                ) { highschool in
                    viewModel.userInfo.highschool = highschool
                    viewModel.updateState(state: .club)
                    viewModel.updateIsShowingSchoolBottomSheet(isShowing: false)
                }
            }
            .bitgouelBottomSheet(isShowing: $viewModel.isShowingClubBottomSheet) {
                SearchClubListBottomSheet(
                    clubList: viewModel.clubList,
                    selectedClub: viewModel.userInfo.clubName,
                    onClubSelect: { clubName in
                        viewModel.userInfo.clubName = clubName
                        viewModel.updateState(state: .name)
                        viewModel.updateIsShowingClubBottomSheet(isShowing: false)
                    }
                )
            }
            .bitgouelBottomSheet(isShowing: $viewModel.isShowingAffiliationBottomSheet) {
                AffiliationBottomSheet(
                    selectedAffiliation: viewModel.selectedAffiliation
                ) { affiliation in
                    viewModel.selectedAffiliation = affiliation
                    viewModel.updateState(state: .career)
                    viewModel.updateIsShowingAffiliationBottomSheet(isShowing: false)
                }
            }
            .bitgouelBottomSheet(isShowing: $viewModel.isShowingUserRoleBottomSheet) {
                UserRoleTypeBottomSheet(
                    selectedAffiliation: viewModel.selectedAffiliation ?? .school,
                    selectedUserRole: viewModel.selectedUserRole
                ) { userRole in
                    viewModel.selectedUserRole = userRole
                    viewModel.updateState(state: .school)
                    viewModel.updateIsShowingUserRoleBottomSheet(isShowing: false)
                }
            }
            .bitgouelBottomSheet(isShowing: $viewModel.isShowingUniversityBottomSheet) {
                SearchUniversityListBottomSheet(
                    universityList: viewModel.universityList,
                    selectedUniversity: viewModel.selectedUniversity
                ) { university in
                    viewModel.selectedUniversity = university
                    viewModel.updateState(state: .phoneNumber)
                    viewModel.updateIsShowingUniversityBottomSheet(isShowing: false)
                }
            }
            .bitgouelBottomSheet(isShowing: $viewModel.isShowingCompanyBottomSheet) {
                SearchCompanyBottomSheet(
                    companyList: viewModel.companyList,
                    selectedCompany: viewModel.selectedCompany
                ) { company in
                    viewModel.selectedCompany = company
                    viewModel.updateState(state: .phoneNumber)
                    viewModel.updateIsShowingCompanyBottomSheet(isShowing: false)
                }
            }
            .bitgouelBottomSheet(isShowing: $viewModel.isShowingGovernmentBottomSheet) {
                SearchGovernmentBottomSheet(
                    governmentList: viewModel.governmentList,
                    selectedGovernment: viewModel.governmentInfo.name
                ) { government in
                    viewModel.governmentInfo.name = government
                    viewModel.updateState(state: .sectors)
                }
            }
            .animation(.default, value: viewModel.selectedUserRole)
            .navigate(
                to: successSignUpFactory.makeView().eraseToAnyView(),
                when: $viewModel.isPresentedSuccessView
            )
        }
        .onChange(of: viewModel.userInfo.highschool) { _ in
            viewModel.userInfo.clubName = ""
            viewModel.fetchClubList()
        }
        .bitgouelBackButton(dismiss: dismiss)
        .navigationBarBackButtonHidden()
    }

    @ViewBuilder
    func signupTitleSection() -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.state.toTitle())
                        .bitgouelFont(.title2)

                    Text(viewModel.state.toSubTitle())
                        .bitgouelFont(.text3, color: .greyscale(.g4))
                }

                Spacer()
            }
            .padding(.top, 24)
        }
        .padding(.horizontal, 28)
    }

    @ViewBuilder
    func inputAuthorizationInfoSection() -> some View {
        if !viewModel.userInfo.password.isEmpty {
            InputCheckPasswordSection(
                password: viewModel.userInfo.password,
                checkPassword: viewModel.checkPassword
            ) { checkPassword in
                viewModel.checkPassword = checkPassword
            }
        }

        if !viewModel.userInfo.email.isEmpty {
            InputPasswordSection(password: viewModel.userInfo.password) { state in
                viewModel.updateState(state: state)
            } enteredPassword: { password in
                viewModel.userInfo.password = password
            }
        }

        if !viewModel.userInfo.phoneNumber.isEmpty {
            InputEmailSection(email: viewModel.userInfo.email) { state in
                viewModel.updateState(state: state)
            } enteredEmail: { email in
                viewModel.userInfo.email = email
            }
        }

        InputPhoneNumberSection(phoneNumber: viewModel.userInfo.phoneNumber) { state in
            viewModel.updateState(state: state)
        } enteredPhoneNumber: { phoneNumber in
            viewModel.userInfo.phoneNumber = phoneNumber
        }
    }

    @ViewBuilder
    func inputGeneralInfoSection() -> some View {
        VStack(spacing: 16) {
            if !viewModel.userInfo.clubName.isEmpty {
                InputNameSection(name: viewModel.userInfo.name) { name in
                    viewModel.userInfo.name = name
                } updateState: {
                    viewModel.userRoleState()
                }
            }

            if !viewModel.userInfo.highschool.isEmpty {
                PickerTextField(
                    "동아리",
                    text: viewModel.userInfo.clubName
                ) {
                    viewModel.updateIsShowingClubBottomSheet(isShowing: true)
                }
            }

            if viewModel.selectedUserRole != nil {
                PickerTextField(
                    "학교",
                    text: viewModel.userInfo.highschool
                ) {
                    viewModel.updateIsShowingSchoolBottomSheet(isShowing: true)
                }
            }

            if viewModel.selectedAffiliation != nil {
                AssociationSelectButton(text: viewModel.selectedUserRole?.display() ?? "직업") {
                    viewModel.updateIsShowingUserRoleBottomSheet(isShowing: true)
                }
            }

            AssociationSelectButton(text: viewModel.selectedAffiliation?.rawValue ?? "소속") {
                viewModel.updateIsShowingAffiliationBottomSheet(isShowing: true)
            }
        }
    }

    // MARK: Student
    @ViewBuilder
    func inputStudentInfoSection() -> some View {
        VStack(spacing: 8) {
            if viewModel.admissionNumber != nil {
                InputStudentIDNumberSection { grade, classRoom, number in
                    viewModel.updateStudentIDNumber(grade: grade, classRoom: classRoom, number: number)
                } updateState: { state in
                    viewModel.updateState(state: state)
                }
                .padding(.bottom, 20)
            }

            InputAdmissionSection(admissionNumber: viewModel.admissionNumber ?? 0) { admissionNumber in
                if let admissionNumber {
                    viewModel.admissionNumber = admissionNumber
                } else {
                    print("Invalid admission number")
                    return
                }
            } updateState: { state in
                viewModel.updateState(state: state)
                viewModel.studentInfo = .init(grade: 0, classRoom: 0, number: 0)
            }
        }
    }

    // MARK: Government
    @ViewBuilder
    func inputGovernmentInfoSection() -> some View {
        VStack(spacing: 8) {
            if !viewModel.governmentInfo.sectors.isEmpty {
                BitgouelTextField(
                    "본인의 직책",
                    text: Binding(
                        get: { viewModel.governmentInfo.position },
                        set: { newValue in
                            viewModel.governmentInfo.position = newValue
                            viewModel.updateState(state: .phoneNumber)
                        }
                    )
                )
            }

            if !viewModel.governmentInfo.name.isEmpty {
                BitgouelTextField(
                    "소속 기관의 업종",
                    text: Binding(
                        get: { viewModel.governmentInfo.sectors },
                        set: { newValue in
                            viewModel.governmentInfo.sectors = newValue
                            viewModel.updateState(state: .position)
                        }
                    )
                )
            }

            PickerTextField(
                "소속 기관명",
                text: viewModel.governmentInfo.name
            ) {
                viewModel.updateIsShowingGovernmentBottomSheet(isShowing: true)
                viewModel.updateState(state: .sectors)
            }
        }
    }

    @ViewBuilder
    func signupApplyButton() -> some View {
        BitgouelButton(
            text: "회원가입 신청하기",
            style: .primary
        ) {
            viewModel.signup {
                scenceState.sceneFlow = .signup
                viewModel.updateIsPresentedSuccessView(isPresented: true)
            }
        }
    }
}

// swiftlint: enable type_body_length
