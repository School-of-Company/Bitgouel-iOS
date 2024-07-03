import Foundation
import Service

// swiftlint: disable type_body_length
final class SignUpViewModel: BaseViewModel {
    // MARK: presentation
    @Published var isPresentedAssociationSheet = false
    @Published var isPresentedUserRoleSheet = false
    @Published var isPresentedSchoolSheet = false
    @Published var isPresentedClubSheet = false
    @Published var isShowingSuccessView = false

    // MARK: variable
    @Published var schoolSearch = ""
    @Published var clubSearch = ""
    @Published var name = ""
    @Published var yearOfAdmission: Int?
    @Published var phoneNumber = ""

    @Published var email = ""
    @Published var password = ""
    @Published var checkPassword = ""
    @Published var selectedSchool: HighSchoolType?
    @Published var selectedClub: String?
    @Published var selectedUniversity: String = ""
    @Published var selectedGovernment: String = ""
    @Published var selectedCompany: String = ""
    @Published var grade: Int?
    @Published var classRoom: Int?
    @Published var number: Int?
    @Published var studentID: String = ""
    @Published var selectedAssociation: AssociationType?
    @Published var selectedUserRole: UserAuthorityType?
    @Published var position: String = ""
    @Published var sectors: String = ""
    @Published var isEmailErrorOccurred: Bool = false
    @Published var isPasswordErrorOccurred: Bool = false
    @Published var isCheckPasswordErrorOccurred: Bool = false
    @Published var isPhoneNumberErrorOccurred: Bool = false

    // MARK: computed property
    var clubsForSelectedHighSchool: [String] {
        selectedSchool?.getClubsForSelectedHighSchool() ?? []
    }

    // MARK: validation
    var nameIsValid: Bool {
        name.count >= 2
    }

    var yearOfAdmissionIsValid: Bool {
        (yearOfAdmission ?? 0) >= 1000
    }

    var studentIDIsValid: Bool {
        studentID.count == 4 && grade != nil && classRoom != nil && number != nil
    }

    func checkphoneNumber(phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^010\\d{8}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex).evaluate(with: phoneNumber)
    }

    func checkEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func checkPassword(password: String) -> Bool {
        let passwordRegex = "[A-Z0-9a-z@!#$%%^~&*()_+-=.]{8,24}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

    // MARK: usecase
    private let studentSignupUseCase: StudentSignupUseCase
    private let teacherSignupUseCase: TeacherSignupUseCase
    private let bbozzakSignupUseCase: BbozzakSignupUseCase
    private let professorSignupUseCase: ProfessorSignupUseCase
    private let governmentSignupUseCase: GovernmentSignupUseCase
    private let companyInstructorSignupUseCase: CompanyInstructorSignupUseCase
    let highSchool: [HighSchoolType] = HighSchoolType.allCases

    init(
        studentSignupUseCase: StudentSignupUseCase,
        teacherSignupUseCase: TeacherSignupUseCase,
        bbozzakSignupUseCase: BbozzakSignupUseCase,
        professorSignupUseCase: ProfessorSignupUseCase,
        governmentSignupUseCase: GovernmentSignupUseCase,
        companyInstructorSignupUseCase: CompanyInstructorSignupUseCase
    ) {
        self.studentSignupUseCase = studentSignupUseCase
        self.teacherSignupUseCase = teacherSignupUseCase
        self.bbozzakSignupUseCase = bbozzakSignupUseCase
        self.professorSignupUseCase = professorSignupUseCase
        self.governmentSignupUseCase = governmentSignupUseCase
        self.companyInstructorSignupUseCase = companyInstructorSignupUseCase
    }

    var searchedSchoolList: [HighSchoolType] {
        if schoolSearch.isEmpty {
            return highSchool
        } else {
            return highSchool.filter { $0.display().contains(schoolSearch) }
        }
    }

    var searchedClubList: [String] {
        if clubSearch.isEmpty {
            return clubsForSelectedHighSchool
        } else {
            return clubsForSelectedHighSchool.filter { $0.lowercased().contains(clubSearch.lowercased()) }
        }
    }

    var titleMessage: String {
        if selectedAssociation == nil {
            return "만나서 반가워요!"
        }
        if selectedUserRole == nil {
            return "무슨 일을 하시나요?"
        }
        if selectedSchool == nil {
            return "학교 선택"
        }
        if selectedClub == nil {
            return "동아리 선택"
        }
        if !nameIsValid {
            return "이름 입력"
        }

        switch selectedUserRole {
        case .student:
            if !yearOfAdmissionIsValid {
                return "입학년도 입력"
            } else if !studentIDIsValid {
                return "학번 입력"
            }

        case .companyInstructor:
            if selectedCompany.isEmpty {
                return "기업 입력"
            }

        case .professor:
            if selectedUniversity.isEmpty {
                return "대학 입력"
            }

        case .government:
            if selectedGovernment.isEmpty {
                return "기관 입력"
            } else if sectors.isEmpty {
                return "업종 입력"
            } else if position.isEmpty {
                return "직책 입력"
            }

        default:
            return ""
        }

        if phoneNumber.isEmpty {
            return "전화번호 입력"
        } else if email.isEmpty {
            return "이메일 입력"
        } else if password.isEmpty {
            return "비밀번호 입력"
        } else {
            return "비밀번호 재입력"
        }
    }

    var subTitleMessage: String {
        switch selectedUserRole {
        case .student:
            if selectedSchool == nil {
                return "재학 중이신 학교를 선택해주세요!"
            } else if selectedClub == nil {
                return "가입하신 동아리를 선택해주세요!"
            } else if !nameIsValid {
                return "이름을 입력해 주세요!"
            } else if !yearOfAdmissionIsValid {
                return "입학하신 연도를 입력해주세요!"
            } else if !studentIDIsValid {
                return "학년, 반, 번호를 입력해주세요! (ex: 1101)"
            }

        case .teacher, .bbozzack:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해주세요!"
            } else if selectedClub == nil {
                return "가입하신 동아리를 선택해주세요!"
            } else if !nameIsValid {
                return "이름을 입력해주세요!"
            }

        case .companyInstructor:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해주세요!"
            } else if selectedClub == nil {
                return "가입하신 동아리를 선택해주세요!"
            } else if !nameIsValid {
                return "이름을 입력해주세요!"
            } else if selectedCompany.isEmpty {
                return "소속하신 기업을 입력해주세요!"
            }

        case .professor:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해주세요!"
            } else if selectedClub == nil {
                return "가입하신 동아리를 선택해주세요!"
            } else if !nameIsValid {
                return "이름을 입력해주세요!"
            } else if selectedUniversity.isEmpty {
                return "소속하신 대학을 입력해주세요!"
            }

        case .government:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해주세요!"
            } else if !nameIsValid {
                return "이름을 입력해주세요!"
            } else if selectedGovernment.isEmpty {
                return "소속하신 기관을 입력해주세요!"
            } else if sectors.isEmpty {
                return "소속하신 기관의 업종을 입력해주세요!"
            } else if position.isEmpty {
                return "본인의 직책을 입력해주세요!"
            }

        default:
            return ""
        }

        if phoneNumber.isEmpty {
            return "전화번호를 입력해주세요!"
        } else if email.isEmpty {
            return "이메일을 입력해주세요!"
        } else if password.isEmpty {
            return "8~24자 이내의 영문 / 숫자, 특수문자 1개 이상"
        } else {
            return "비밀번호를 다시 입력해주세요!"
        }
    }

    func parseStudentID() {
        if studentID.count == 4 {
            grade = Int(studentID.prefix(1))
            classRoom = Int(studentID.dropFirst(1).prefix(1))
            number = Int(studentID.suffix(2))
        } else {
            grade = nil
            classRoom = nil
            number = nil
        }
    }

    var selectedSchoolExists: Bool {
        selectedSchool != nil
    }

    var selectedClubExists: Bool {
        selectedClub != nil
    }

    var emailHelpMessage: String {
        guard !email.isEmpty else { return "" }

        if isEmailErrorOccurred {
            return "이메일 형식이 유효하지 않습니다"
        } else {
            return ""
        }
    }

    var passwordHelpMessage: String {
        guard !password.isEmpty else { return "" }

        if isPasswordErrorOccurred {
            return "비밀번호는 (정규식)으로 해주세요"
        } else {
            return ""
        }
    }

    var checkPasswordHelpMessage: String {
        guard !checkPassword.isEmpty else { return "" }

        if isCheckPasswordErrorOccurred {
            return "비밀번호가 일치하지 않습니다"
        } else {
            return ""
        }
    }

    var phoneNumberHelpMessage: String {
        guard !phoneNumber.isEmpty else { return "" }

        if isPhoneNumberErrorOccurred {
            return "전화번호는 010으로 시작하고 11자 이상이어야 합니다."
        } else {
            return ""
        }
    }

    func checkedPassword() -> Bool {
        return password == checkPassword
    }

    func updateStudentID(id: String) {
        studentID = id
        parseStudentID()
    }

    func updateIsShowingSuccessView(isShowing: Bool) {
        isShowingSuccessView = isShowing
    }

    func updateIsEmailErrorOccurred(isErrorOccurred: Bool) {
        isEmailErrorOccurred = isErrorOccurred
    }

    func updateIsPasswordErrorOccurred(isErrorOccurred: Bool) {
        isPasswordErrorOccurred = isErrorOccurred
    }

    func updateIsCheckPasswordErrorOccurred(isErrorOccurred: Bool) {
        isCheckPasswordErrorOccurred = isErrorOccurred
    }

    func updateIsPhoneNumberErrorOccurred(isErrorOccurred: Bool) {
        isPhoneNumberErrorOccurred = isErrorOccurred
    }

    // swiftlint: disable cyclomatic_complexity
    @MainActor
    func signup(_ success: @escaping () -> Void) {
        guard let selectedSchool else { return }
        guard let selectedClub else { return }
        guard checkphoneNumber(phoneNumber: phoneNumber) else { return updateIsPhoneNumberErrorOccurred(isErrorOccurred: true) }
        guard checkEmail(email: email) else { return updateIsEmailErrorOccurred(isErrorOccurred: true) }
        guard checkPassword(password: password) else { return updateIsPasswordErrorOccurred(isErrorOccurred: true) }
        guard checkedPassword() else { return updateIsCheckPasswordErrorOccurred(isErrorOccurred: true) }

        Task {
            do {
                switch selectedUserRole {
                case .student:
                    try await studentSignup(
                        selectedSchool: selectedSchool,
                        selectedClub: selectedClub
                    )

                case .teacher:
                    try await teacherSignup(
                        selectedSchool: selectedSchool,
                        selectedClub: selectedClub
                    )

                case .companyInstructor:
                    try await companyInstructorSignup(
                        selectedSchool: selectedSchool,
                        selectedClub: selectedClub
                    )

                case .professor:
                    try await professorSignup(
                        selectedSchool: selectedSchool,
                        selectedClub: selectedClub
                    )

                case .bbozzack:
                    try await bbozzakSignup(
                        selectedSchool: selectedSchool,
                        selectedClub: selectedClub
                    )

                case .government:
                    try await governmentSignup(
                        selectedSchool: selectedSchool,
                        selectedClub: selectedClub
                    )

                default:
                    return
                }

                print("\(selectedUserRole.debugDescription) 회원가입 성공")
                success()
            } catch {
                if let authDomainError = error as? AuthDomainError {
                    errorMessage = authDomainError.localizedDescription
                    isErrorOccurred = true
                } else {
                    errorMessage = "알 수 없는 오류가 발생했습니다."
                    isErrorOccurred = true
                }
            }
        }
    }

    // swiftlint: enable cyclomatic_complexity

    // swiftlint: disable function_parameter_count
    func studentSignup(
        selectedSchool: HighSchoolType,
        selectedClub: String
    ) async throws {
        guard let grade else { return }
        guard let classRoom else { return }
        guard let number else { return }
        guard let yearOfAdmission else { return }

        try await studentSignupUseCase(
            req: StudentSignupRequestDTO(
                email: email,
                name: name,
                phoneNumber: phoneNumber,
                password: password,
                highSchool: selectedSchool,
                clubName: selectedClub,
                grade: grade,
                classRoom: classRoom,
                number: number,
                admissionNumber: yearOfAdmission
            )
        )
    }

    // swiftlint: enable function_parameter_count

    func teacherSignup(
        selectedSchool: HighSchoolType,
        selectedClub: String
    ) async throws {
        try await teacherSignupUseCase(
            req: TeacherSignupRequestDTO(
                email: email,
                name: name,
                phoneNumber: phoneNumber,
                password: password,
                highSchool: selectedSchool,
                clubName: selectedClub
            )
        )
    }

    func bbozzakSignup(
        selectedSchool: HighSchoolType,
        selectedClub: String
    ) async throws {
        try await bbozzakSignupUseCase(
            req: BbozzakSignupRequestDTO(
                email: email,
                name: name,
                phoneNumber: phoneNumber,
                password: password,
                highSchool: selectedSchool,
                clubName: selectedClub
            )
        )
    }

    func professorSignup(
        selectedSchool: HighSchoolType,
        selectedClub: String
    ) async throws {
        try await professorSignupUseCase(
            req: ProfessorSignupRequestDTO(
                email: email,
                name: name,
                phoneNumber: phoneNumber,
                password: password,
                highSchool: selectedSchool,
                clubName: selectedClub,
                university: selectedUniversity
            )
        )
    }

    func governmentSignup(
        selectedSchool: HighSchoolType,
        selectedClub: String
    ) async throws {
        try await governmentSignupUseCase(
            req: GovernmentSignupRequestDTO(
                email: email,
                name: name,
                phoneNumber: phoneNumber,
                password: password,
                highSchool: selectedSchool,
                clubName: selectedClub,
                governmentName: selectedGovernment,
                position: position,
                sectors: sectors
            )
        )
    }

    func companyInstructorSignup(
        selectedSchool: HighSchoolType,
        selectedClub: String
    ) async throws {
        try await companyInstructorSignupUseCase(
            req: CompanyInstructorSignupRequestDTO(
                email: email,
                name: name,
                phoneNumber: phoneNumber,
                password: password,
                highSchool: selectedSchool,
                clubName: selectedClub,
                company: selectedCompany
            )
        )
    }
}

// swiftlint: enable type_body_length
