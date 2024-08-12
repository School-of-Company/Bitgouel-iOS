import Foundation
import Service

// swiftlint: disable type_body_length
final class SignUpViewModel: BaseViewModel {
    // MARK: presentation
    @Published var isShowingAffiliationBottomSheet = false
    @Published var isShowingUserRoleBottomSheet = false
    @Published var isShowingSchoolBottomSheet = false
    @Published var isShowingClubBottomSheet = false
    @Published var isShowingUniversityBottomSheet = false
    @Published var isShowingGovernmentBottomSheet = false
    @Published var isShowingCompanyBottomSheet = false
    @Published var isPresentedSuccessView = false

    // MARK: variable
    @Published var selectedAffiliation: AffiliationType?
    @Published var selectedUserRole: UserAuthorityType?
    @Published var checkPassword = ""
    @Published var state: SignupFlowState = .affiliation
    @Published var userInfo: UserInfoModel = .init(
        email: "",
        name: "",
        phoneNumber: "",
        password: "",
        highschool: "",
        clubName: ""
    )

    @Published var studentInfo: StudentInfoModel?
    @Published var admissionNumber: Int?
    @Published var selectedUniversity: String = ""
    @Published var selectedCompany: String = ""
    @Published var governmentInfo: GovernmentInfoModel = .init(name: "", position: "", sectors: "")
    var schoolList: [String] = []
    var clubList: [String] = []
    var universityList: [String] = []
    var governmentList: [String] = []
    var companyList: [String] = []

    // MARK: usecase
    private let studentSignupUseCase: StudentSignupUseCase
    private let teacherSignupUseCase: TeacherSignupUseCase
    private let bbozzakSignupUseCase: BbozzakSignupUseCase
    private let professorSignupUseCase: ProfessorSignupUseCase
    private let governmentSignupUseCase: GovernmentSignupUseCase
    private let companyInstructorSignupUseCase: CompanyInstructorSignupUseCase
    private let fetchAllSchoolNameUseCase: any FetchAllSchoolNameUseCase
    private let fetchAllClubNameUseCase: any FetchAllClubNameUseCase
    private let fetchCompanyListUseCase: any FetchCompanyListUseCase
    private let fetchUniversityListUseCase: any FetchUniversityListUseCase
    private let fetchGovernmentListUseCase: any FetchGovernmentListUseCase

    init(
        studentSignupUseCase: StudentSignupUseCase,
        teacherSignupUseCase: TeacherSignupUseCase,
        bbozzakSignupUseCase: BbozzakSignupUseCase,
        professorSignupUseCase: ProfessorSignupUseCase,
        governmentSignupUseCase: GovernmentSignupUseCase,
        companyInstructorSignupUseCase: CompanyInstructorSignupUseCase,
        fetchAllSchoolNameUseCase: any FetchAllSchoolNameUseCase,
        fetchAllClubNameUseCase: any FetchAllClubNameUseCase,
        fetchCompanyListUseCase: any FetchCompanyListUseCase,
        fetchUniversityListUseCase: any FetchUniversityListUseCase,
        fetchGovernmentListUseCase: any FetchGovernmentListUseCase
    ) {
        self.studentSignupUseCase = studentSignupUseCase
        self.teacherSignupUseCase = teacherSignupUseCase
        self.bbozzakSignupUseCase = bbozzakSignupUseCase
        self.professorSignupUseCase = professorSignupUseCase
        self.governmentSignupUseCase = governmentSignupUseCase
        self.companyInstructorSignupUseCase = companyInstructorSignupUseCase
        self.fetchAllSchoolNameUseCase = fetchAllSchoolNameUseCase
        self.fetchAllClubNameUseCase = fetchAllClubNameUseCase
        self.fetchCompanyListUseCase = fetchCompanyListUseCase
        self.fetchUniversityListUseCase = fetchUniversityListUseCase
        self.fetchGovernmentListUseCase = fetchGovernmentListUseCase
    }

    func updateState(state: SignupFlowState) {
        self.state = state
    }

    func userRoleState() {
        switch selectedUserRole {
        case .student:
            updateState(state: .admissionNumber)

        case .teacher, .bbozzack:
            updateState(state: .phoneNumber)

        case .companyInstructor:
            updateState(state: .company)

        case .professor:
            updateState(state: .university)

        case .government:
            updateState(state: .government)

        default:
            updateState(state: .phoneNumber)
        }
    }

    func updateIsShowingAffiliationBottomSheet(isShowing: Bool) {
        isShowingAffiliationBottomSheet = isShowing
    }

    func updateIsShowingUserRoleBottomSheet(isShowing: Bool) {
        isShowingUserRoleBottomSheet = isShowing
    }

    func updateIsShowingSchoolBottomSheet(isShowing: Bool) {
        isShowingSchoolBottomSheet = isShowing
    }

    func updateIsShowingClubBottomSheet(isShowing: Bool) {
        isShowingClubBottomSheet = isShowing
    }

    func updateIsShowingUniversityBottomSheet(isShowing: Bool) {
        isShowingUniversityBottomSheet = isShowing
    }

    func updateIsShowingGovernmentBottomSheet(isShowing: Bool) {
        isShowingGovernmentBottomSheet = isShowing
    }

    func updateIsShowingCompanyBottomSheet(isShowing: Bool) {
        isShowingCompanyBottomSheet = isShowing
    }

    func updateIsPresentedSuccessView(isPresented: Bool) {
        isPresentedSuccessView = isPresented
    }

    func updateStudentIDNumber(grade: Int, classRoom: Int, number: Int) {
        studentInfo?.grade = grade
        studentInfo?.classRoom = classRoom
        studentInfo?.number = number
    }

    // swiftlint: disable cyclomatic_complexity
    @MainActor
    func signup(_ success: @escaping () -> Void) {
        Task {
            do {
                switch selectedUserRole {
                case .student:
                    try await studentSignup()

                case .teacher:
                    try await teacherSignup()

                case .companyInstructor:
                    try await companyInstructorSignup()

                case .professor:
                    try await professorSignup()

                case .bbozzack:
                    try await bbozzakSignup()

                case .government:
                    try await governmentSignup()

                default:
                    return
                }

                success()
            } catch {
                errorMessage = error.authDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func fetchSchoolList() {
        Task {
            do {
                schoolList = try await fetchAllSchoolNameUseCase()
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func fetchClubList() {
        Task {
            do {
                clubList = try await fetchAllClubNameUseCase(schoolName: userInfo.highschool)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func fetchCompanyList() {
        Task {
            do {
                let response = try await fetchCompanyListUseCase()

                companyList = response.map(\.companyName)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func fetchUniversityList() {
        Task {
            do {
                let response = try await fetchUniversityListUseCase()

                universityList = response.map(\.universityName)
            } catch {
                print(String(describing: error))
            }
        }
    }

    func fetchGovernmentList() {
        Task {
            do {
                let response = try await fetchGovernmentListUseCase()

                governmentList = response.map(\.governmentName)
            } catch {
                print(String(describing: error))
            }
        }
    }

    func studentSignup() async throws {
        guard let studentInfo else { return }
        guard let admissionNumber else { return }

        try await studentSignupUseCase(
            req: StudentSignupRequestDTO(
                email: userInfo.email,
                name: userInfo.name,
                phoneNumber: userInfo.phoneNumber,
                password: userInfo.password,
                highSchool: userInfo.highschool,
                clubName: userInfo.clubName,
                grade: studentInfo.grade,
                classRoom: studentInfo.classRoom,
                number: studentInfo.number,
                admissionNumber: admissionNumber
            )
        )
    }

    func teacherSignup() async throws {
        try await teacherSignupUseCase(
            req: TeacherSignupRequestDTO(
                email: userInfo.email,
                name: userInfo.name,
                phoneNumber: userInfo.phoneNumber,
                password: userInfo.password,
                highSchool: userInfo.highschool,
                clubName: userInfo.clubName
            )
        )
    }

    func bbozzakSignup() async throws {
        try await bbozzakSignupUseCase(
            req: BbozzakSignupRequestDTO(
                email: userInfo.email,
                name: userInfo.name,
                phoneNumber: userInfo.phoneNumber,
                password: userInfo.password,
                highSchool: userInfo.highschool,
                clubName: userInfo.clubName
            )
        )
    }

    func professorSignup() async throws {
        try await professorSignupUseCase(
            req: ProfessorSignupRequestDTO(
                email: userInfo.email,
                name: userInfo.name,
                phoneNumber: userInfo.phoneNumber,
                password: userInfo.password,
                highSchool: userInfo.highschool,
                clubName: userInfo.clubName,
                university: selectedUniversity
            )
        )
    }

    func governmentSignup() async throws {
        try await governmentSignupUseCase(
            req: GovernmentSignupRequestDTO(
                email: userInfo.email,
                name: userInfo.name,
                phoneNumber: userInfo.phoneNumber,
                password: userInfo.password,
                highSchool: userInfo.highschool,
                clubName: userInfo.clubName,
                governmentName: governmentInfo.name,
                position: governmentInfo.position,
                sectors: governmentInfo.sectors
            )
        )
    }

    func companyInstructorSignup() async throws {
        try await companyInstructorSignupUseCase(
            req: CompanyInstructorSignupRequestDTO(
                email: userInfo.email,
                name: userInfo.name,
                phoneNumber: userInfo.phoneNumber,
                password: userInfo.password,
                highSchool: userInfo.highschool,
                clubName: userInfo.clubName,
                company: selectedCompany
            )
        )
    }
}

// swiftlint: enable type_body_length
