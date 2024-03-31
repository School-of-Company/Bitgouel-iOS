import Service
import SwiftUI

// swiftlint: disable type_body_length
struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
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

                VStack(spacing: 16) {
                    switch viewModel.selectedUserRole {
                    case .student:
                        ConditionView(viewModel.studentIDIsValid) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(viewModel.nameIsValid) {
                            inputStudentInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != nil) {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != nil) {
                            inputClubSection()
                        }
                    case .teacher, .bbozzack:
                        ConditionView(viewModel.nameIsValid) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != nil) {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != nil) {
                            inputClubSection()
                        }
                    case .companyInstructor:
                        ConditionView(!viewModel.selectedCompany.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(viewModel.nameIsValid) {
                            inputCompanyInstructorInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != nil) {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != nil) {
                            inputClubSection()
                        }
                    case .professor:
                        ConditionView(!viewModel.selectedUniversity.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(viewModel.nameIsValid) {
                            inputProfessorInfoSection()
                        }

                        ConditionView(viewModel.selectedClub != nil) {
                            inputNameSection()
                        }

                        ConditionView(viewModel.selectedSchool != nil) {
                            inputClubSection()
                        }
                    case .government:
                        ConditionView(!viewModel.selectedGovernment.isEmpty) {
                            inputAuthorizationInfoSection()
                        }

                        ConditionView(viewModel.nameIsValid) {
                            inputGovernmentInfoSection()
                        }

                        ConditionView(viewModel.selectedSchool != nil) {
                            inputNameSection()
                        }
                    default:
                        EmptyView()
                    }
                    inputSchoolInfoSection()
                }
                .padding(.horizontal, 28)
                .padding(.top, 32)
            }
        }
        .bitgouelBottomSheet(
            isShowing: $viewModel.isPresentedSchoolSheet
        ) {
            SchoolListView(
                searchKeyword: $viewModel.schoolSearch,
                schoolList: viewModel.searchedSchoolList,
                selectedSchool: viewModel.selectedSchool
            ) { highschool in
                viewModel.selectedSchool = highschool
                viewModel.isPresentedSchoolSheet = false
            }
            .frame(height: 415)
        }
        .bitgouelBottomSheet(
            isShowing: $viewModel.isPresentedClubSheet
        ) {
            SearchClubListView(
                searchText: $viewModel.clubSearch,
                searchedClubList: viewModel.searchedClubList,
                selectedClub: viewModel.selectedClub ?? "동아리",
                clubDidSelect: { selectedClub in
                    viewModel.selectedClub = selectedClub
                    viewModel.isPresentedClubSheet = false
                }
            )
            .frame(height: 415)
        }
        .bitgouelBottomSheet(
            isShowing: $viewModel.isPresentedAssociationSheet
        ) {
            associationTypeView()
        }
        .bitgouelBottomSheet(
            isShowing: $viewModel.isPresentedUserRoleSheet
        ) {
            userRoleTypeView()
        }
        .animation(.default, value: viewModel.selectedAssociation)
        .navigate(
            to: successSignUpFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isShowingSuccessView },
                set: { _ in viewModel.isShowingSuccessView = false }
            )
        )
        .bitgouelBackButton(dismiss: dismiss)
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
                if viewModel.passwordIsValid {
                    SecureBitgouelTextField(
                        "비밀번호",
                        text: $viewModel.checkPassword
                    )
                    .padding(.bottom, -20)
                    .onSubmit {
                        viewModel.signup()
                    }
                }

                if viewModel.emailIsValid {
                    SecureBitgouelTextField(
                        "비밀번호",
                        text: $viewModel.password
                    )
                    .padding(.bottom, -20)
                }
            }

            Group {
                if viewModel.phoneNumberIsValid {
                    BitgouelTextField(
                        "이메일",
                        text: $viewModel.email,
                        helpMessage: viewModel.emailHelpMessage,
                        isError: !viewModel.emailIsValid
                    )
                    .textContentType(.emailAddress)
                }
            }
            Group {
                BitgouelTextField(
                    "전화번호",
                    text: $viewModel.phoneNumber
                )
                .padding(.bottom, -20)
            }
        }
    }

    @ViewBuilder
    func inputSchoolInfoSection() -> some View {
        VStack(spacing: 16) {
            ConditionView(viewModel.selectedUserRole != nil) {
                AssociationSelectButton(
                    text: viewModel.selectedSchool?.display() ?? "학교"
                ) {
                    viewModel.isPresentedSchoolSheet.toggle()
                }
            }

            ConditionView(viewModel.selectedAssociation != nil) {
                AssociationSelectButton(text: viewModel.selectedUserRole?.display() ?? "직업") {
                    viewModel.isPresentedUserRoleSheet = true
                }
            }

            AssociationSelectButton(text: viewModel.selectedAssociation?.associationValue() ?? "소속") {
                viewModel.isPresentedAssociationSheet = true
            }
        }
    }

    @ViewBuilder
    func inputClubSection() -> some View {
        VStack(spacing: 0) {
            AssociationSelectButton(
                text: viewModel.selectedClub ?? "동아리"
            ) {
                viewModel.isPresentedClubSheet.toggle()
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
            if viewModel.yearOfAdmissionIsValid {
                BitgouelTextField(
                    "학번",
                    text: Binding(
                        get: { viewModel.studentID },
                        set: { newValue in
                            viewModel.studentID = newValue
                        }
                    ),
                    onSubmit: {
                        viewModel.parseStudentID()
                    }
                )
                .padding(.bottom, -20)
            }

            BitgouelTextField(
                "입학년도",
                text: Binding(
                    get: {
                        guard let yearOfAdmission = viewModel.yearOfAdmission else { return "" }
                        return String(yearOfAdmission)
                    },
                    set: { newValue in
                        guard let yearOfAdmission = Int(newValue) else { return }
                        viewModel.yearOfAdmission = yearOfAdmission
                    }
                )
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

    @ViewBuilder
    func userRoleTypeView() -> some View {
        ScrollView {
            let data: [UserAuthorityType] = viewModel.selectedAssociation == .school
                ? [.student, .teacher]
                : [.companyInstructor, .professor, .bbozzack, .government]
            ForEach(data, id: \.self) { userRole in
                HStack {
                    Text(userRole.display())

                    Spacer()

                    BitgouelRadioButton(
                        isSelected: Binding(
                            get: { viewModel.selectedUserRole == userRole },
                            set: { isSelected in
                                if isSelected {
                                    viewModel.isPresentedUserRoleSheet = false
                                    viewModel.selectedUserRole = userRole
                                }
                            }
                        )
                    )
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 24)
            }
        }
    }

    @ViewBuilder
    func associationTypeView() -> some View {
        ScrollView {
            ForEach(AssociationType.allCases, id: \.self) { association in
                HStack {
                    Text(association.associationValue())

                    Spacer()

                    BitgouelRadioButton(
                        isSelected: Binding(
                            get: { viewModel.selectedAssociation == association },
                            set: { isSelected in
                                if isSelected {
                                    viewModel.isPresentedAssociationSheet = false
                                    viewModel.selectedAssociation = association
                                }
                            }
                        )
                    )
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 24)
            }
        }
    }
}

// swiftlint: enable type_body_length
