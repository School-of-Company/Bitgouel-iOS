import Foundation
import Service

class StudentSignUpViewModel: BaseViewModel {
    @Published var schoolSearch = ""
    @Published var clubSearch = ""
    @Published var name = ""
    @Published var yearOfAdmission = ""
    @Published var studentID = "" {
        didSet {
            parseStudentID()
        }
    }

    @Published var phoneNumber = "" {
        didSet {
            parsePhoneNumber()
        }
    }

    @Published var certificationNumberPhoneNumber = ""
    @Published var email = ""
    @Published var certificationNumberEmail = ""
    @Published var password = ""
    @Published var checkPassword = ""
    @Published var phoneNumberTimeRemaining: Int = 180
    @Published var emailTimeRemaining: Int = 180
    @Published var selectedSchool: HighSchoolType?
    @Published var selectedClub: String = "동아리"
    @Published var selectedUniversity: String = ""
    @Published var selectedGovernment: String = ""
    @Published var selectedCompany: String = ""
    @Published var clubsForSelectedHighSchool: [String] = []
    @Published var userRole: UserRoleType = .professor
    private var timer: Timer?
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

    var getClubsForSelectedHighSchool: HighSchoolType? {
        didSet {
            clubsForSelectedHighSchool = getClubsForSelectedHighSchool?.getClubsForSelectedHighSchool() ?? []
        }
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
        if selectedSchool == nil {
            return "학교 선택"
        }
        switch userRole {
        case .student:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if name.isEmpty {
                return "이름 입력"
            } else if yearOfAdmission.isEmpty {
                return "입학년도 입력"
            } else if studentID.isEmpty {
                return "학번 입력"
            }
        case .teacher, .bbozzack:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if name.isEmpty {
                return "이름 입력"
            }

        case .companyInstructor:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if name.isEmpty {
                return "이름 입력"
            } else if selectedCompany.isEmpty {
                return "기업 입력"
            }

        case .professor:
            if selectedClub == "동아리" {
                return "동아리 선택"
            } else if name.isEmpty {
                return "이름 입력"
            } else if selectedUniversity.isEmpty {
                return "대학 입력"
            }

        case .government:
            if name.isEmpty {
                return "이름 입력"
            } else if selectedGovernment.isEmpty {
                return "기관 입력"
            }
        }

        if phoneNumber.isEmpty {
            return "전화번호 입력"
        } else if certificationNumberPhoneNumber.isEmpty {
            return "인증번호 입력"
        } else if email.isEmpty {
            return "이메일 입력"
        } else if certificationNumberEmail.isEmpty {
            return "인증번호 입력"
        } else if password.isEmpty {
            return "비밀번호 입력"
        } else {
            return "비밀번호 재입력"
        }
    }

    var subTitleMessage: String {
        switch userRole {
        case .student:
            if selectedSchool == nil {
                return "재학 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if name.isEmpty {
                return "이름을 입력해 주세요!"
            } else if yearOfAdmission.isEmpty {
                return "입학하신 연도를 입력해 주세요!"
            } else if studentID.isEmpty {
                return "학년, 반, 번호를 입력해 주세요! (ex: 1101)"
            }
        case .teacher, .bbozzack:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if name.isEmpty {
                return "이름을 입력해 주세요!"
            }
        case .companyInstructor:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if name.isEmpty {
                return "이름을 입력해 주세요!"
            } else if selectedCompany.isEmpty {
                return "소속하신 기업을 입력해주세요!"
            }
        case .professor:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if selectedClub == "동아리" {
                return "가입하신 동아리를 선택해 주세요!"
            } else if name.isEmpty {
                return "이름을 입력해 주세요!"
            } else if selectedUniversity.isEmpty {
                return "소속하신 대학을 입력해주세요!"
            }
        case .government:
            if selectedSchool == nil {
                return "담당 중이신 학교를 선택해 주세요!"
            } else if name.isEmpty {
                return "이름을 입력해 주세요!"
            } else if selectedGovernment.isEmpty {
                return "소속하신 기관을 입력해주세요!"
            }
        }

        if phoneNumber.isEmpty {
            return "인증을 위해 전화번호를 입력해 주세요!"
        } else if certificationNumberPhoneNumber.isEmpty {
            return "받으신 인증번호 N자리를 입력해 주세요!"
        } else if email.isEmpty {
            return "이메일을 입력해 주세요!"
        } else if certificationNumberEmail.isEmpty {
            return "받으신 인증번호 N자리를 입력해 주세요!"
        } else if password.isEmpty {
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

    func phoneNumberStartTimer() {
        guard timer == nil else { return }

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                if self.phoneNumberTimeRemaining > 0 {
                    self.phoneNumberTimeRemaining -= 1
                } else {
                    self.stopTimer()
                }
            }
        }
    }

    func emailStartTimer() {
        guard timer == nil else { return }

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                if self.emailTimeRemaining > 0 {
                    self.emailTimeRemaining -= 1
                } else {
                    self.stopTimer()
                }
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    public func parseStudentID() {
        guard studentID.count == 4,
              let grade = Int(String(studentID.prefix(1))),
              let classNumber = Int(String(studentID.dropFirst(1).prefix(1))),
              let studentNumber = Int(String(studentID.suffix(2)))
        else { return }

        studentID = "\(grade)학년 \(classNumber)반 \(studentNumber)번"
    }

    public func parsePhoneNumber() {
        guard
            phoneNumber.count == 11,
            let firstPart = Int(String(phoneNumber.prefix(3))),
            let secondPart = Int(String(phoneNumber.dropFirst(3).prefix(4))),
            let thirdPart = Int(String(phoneNumber.dropFirst(7)))
        else { return }

        phoneNumber = "\(firstPart)-\(secondPart)-\(thirdPart)"
    }

    func checkEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func checkPassword(_ password: String, _ checkPassword: String) -> Bool {
        return password == checkPassword
    }

    func signup() {
        guard let grade = Int(studentID.prefix(3)) else { return }
        guard let classRoom = Int(studentID.dropFirst(1).prefix(1)) else { return }
        guard let number = Int(studentID.suffix(2)) else { return }
        guard let yearOfAdmission = Int(yearOfAdmission) else { return }
        guard let selectedSchool else { return }

        switch userRole {
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

    var isEmailErrorOccured: Bool {
        if email.isEmpty {
            return false
        }
        if checkEmail(email) {
            return false
        } else {
            return true
        }
    }

    var emailHelpMessage: String {
        if isEmailErrorOccured {
            return "이메일 형식이 유효하지 않습니다"
        } else {
            return ""
        }
    }
}
