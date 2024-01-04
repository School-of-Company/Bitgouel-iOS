import Foundation
import Service

class StudentSignUpViewModel: BaseViewModel {
    // MARK: presentation
    @Published var isPresentedAssociationSheet = false
    @Published var isPresentedUserRoleSheet = false
    @Published var isPresentedSchoolSheet = false
    @Published var isPresentedClubSheet = false
    
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
    @Published var selectedClub: String = "동아리"
    @Published var selectedUniversity: String = ""
    @Published var selectedGovernment: String = ""
    @Published var selectedCompany: String = ""
    @Published var grade: Int?
    @Published var classRoom: Int?
    @Published var number: Int?
    @Published var studentID: String = ""
    @Published var selectedAssociation: AssociationType?
    @Published var selectedUserRole: UserAuthorityType?
    
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
    var phoneNumberIsValid: Bool {
        phoneNumber.count == 11
    }
    var emailIsValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    var passwordIsValid: Bool {
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
        switch selectedUserRole {
        case .student:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if !nameIsValid {
                return "이름 입력"
            } else if !yearOfAdmissionIsValid {
                return "입학년도 입력"
            } else if !studentIDIsValid {
                return "학번 입력"
            }
        case .teacher, .bbozzack:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if !nameIsValid {
                return "이름 입력"
            }

        case .companyInstructor:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if !nameIsValid {
                return "이름 입력"
            } else if selectedCompany.isEmpty {
                return "기업 입력"
            }

        case .professor:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if !nameIsValid {
                return "이름 입력"
            } else if selectedUniversity.isEmpty {
                return "대학 입력"
            }

        case .government:
            if !nameIsValid {
                return "이름 입력"
            } else if selectedGovernment.isEmpty {
                return "기관 입력"
            }
        default:
            return ""
        }

        if !phoneNumberIsValid {
            return "전화번호 입력"
        } else if !emailIsValid {
            return "이메일 입력"
        } else if !passwordIsValid {
            return "비밀번호 입력"
        } else {
            return "비밀번호 재입력"
        }
    }

    var subTitleMessage: String {
        switch selectedUserRole {
        case .student:
            if selectedSchool == nil {
                return "재학 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if !nameIsValid {
                return "이름을 입력해 주세요!"
            } else if !yearOfAdmissionIsValid {
                return "입학하신 연도를 입력해 주세요!"
            } else if !studentIDIsValid {
                return "학년, 반, 번호를 입력해 주세요! (ex: 1101)"
            }
        case .teacher, .bbozzack:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if !nameIsValid {
                return "이름을 입력해 주세요!"
            }
        case .companyInstructor:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if !nameIsValid {
                return "이름을 입력해 주세요!"
            } else if selectedCompany.isEmpty {
                return "소속하신 기업을 입력해주세요!"
            }
        case .professor:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if !nameIsValid {
                return "이름을 입력해 주세요!"
            } else if selectedUniversity.isEmpty {
                return "소속하신 대학을 입력해주세요!"
            }
        case .government:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if !nameIsValid {
                return "이름을 입력해 주세요!"
            } else if selectedGovernment.isEmpty {
                return "소속하신 기관을 입력해주세요!"
            }
        default:
            return ""
        }

        if !phoneNumberIsValid {
            return "인증을 위해 전화번호를 입력해 주세요!"
        } else if !emailIsValid {
            return "이메일을 입력해 주세요!"
        } else if !passwordIsValid {
            return "8~24자 이내의 영문 / 숫자, 특수문자 1개 이상"
        } else {
            return "비밀번호를 다시 입력해 주세요!"
        }
    }

    var selectedSchoolExists: Bool {
        selectedSchool != nil
    }

    var selectedClubExists: Bool {
        selectedClub != "동아리"
    }

    var isPasswordMatching: Bool {
        checkPassword(password, checkPassword)
    }

    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }

    func checkPassword(_ password: String, _ checkPassword: String) -> Bool {
        return password == checkPassword
    }

    func signup() {
        guard let yearOfAdmission else { return }
        guard let selectedSchool else { return }
        guard let grade else { return }
        guard let classRoom else { return }
        guard let number else { return }
        switch selectedUserRole {
        case .student:
            studentSignup(
                grade: grade,
                classRoom: classRoom,
                number: number,
                yearOfAdmission: yearOfAdmission,
                selectedSchool: selectedSchool
            )
        case .teacher:
            teacherSignup(selectedSchool: selectedSchool)
        case .bbozzack:
            bbozzakSignup(selectedSchool: selectedSchool)
        case .professor:
            professorSignup(selectedSchool: selectedSchool)
        case .government:
            governmentSignup(selectedSchool: selectedSchool)
        case .companyInstructor:
            companyInstructorSignup(selectedSchool: selectedSchool)
        default:
            return
        }
    }

    func studentSignup(
        grade: Int,
        classRoom: Int,
        number: Int,
        yearOfAdmission: Int,
        selectedSchool: HighSchoolType
    ) {
        Task {
            do {
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
                print("학생 회원가입 성공")
            } catch {
                print("학생 회원가입 실패")
            }
        }
    }

    func teacherSignup(
        selectedSchool: HighSchoolType
    ) {
        Task {
            do {
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
                print("취동쌤 회원가입 성공")
            } catch {
                print("취동쌤 회원가입 실패")
            }
        }
    }

    func bbozzakSignup(selectedSchool: HighSchoolType) {
        Task {
            do {
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
                print("뽀짝쌤 회원가입 성공")
            } catch {
                print("뽀짝쌤 회원가입 실패")
            }
        }
    }

    func professorSignup(selectedSchool: HighSchoolType) {
        Task {
            do {
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
                print("대학교수 회원가입 성공")
            } catch {
                print("대학교수 회원가입 실패")
            }
        }
    }

    func governmentSignup(selectedSchool: HighSchoolType) {
        Task {
            do {
                try await governmentSignupUseCase(
                    req: GovernmentSignupRequestDTO(
                        email: email,
                        name: name,
                        phoneNumber: phoneNumber,
                        password: password,
                        highSchool: selectedSchool,
                        clubName: selectedClub,
                        governmentName: selectedGovernment
                    )
                )
                print("유관기관 회원가입 성공")
            } catch {
                print("유관기관 회원가입 실패")
            }
        }
    }

    func companyInstructorSignup(selectedSchool: HighSchoolType) {
        Task {
            do {
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
                print("기업강사 회원가입 성공")
            } catch {
                print("기업강사 회원가입 실패")
            }
        }
    }

    var emailHelpMessage: String {
        if !emailIsValid {
            return "이메일 형식이 유효하지 않습니다"
        } else {
            return ""
        }
    }
}
