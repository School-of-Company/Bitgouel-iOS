import Foundation

enum SignupFlowState: String {
    case affiliation
    case career
    case school
    case club
    case name
    case admissionNumber
    case studentNumber
    case phoneNumber
    case email
    case password
    case checkPassword
    case company
    case university
    case government
    case sectors
    case position
}

extension SignupFlowState {
    func toTitle() -> String {
        switch self {
        case .affiliation: return "만나서 반가워요!"
        case .career: return "무슨 일을 하시나요?"
        case .school: return "학교 선택"
        case .club: return "동아리 선택"
        case .name: return "이름 입력"
        case .admissionNumber: return "입학년도 입력"
        case .studentNumber: return "학번 입력"
        case .phoneNumber: return "전화번호 입력"
        case .email: return "이메일 입력"
        case .password: return "비밀번호 입력"
        case .checkPassword: return "비밀번호 재입력"
        case .company: return "기업 입력"
        case .university: return "대학 입력"
        case .government: return "기관 입력"
        case .sectors: return "업종 입력"
        case .position: return "직책 입력"
        }
    }

    func toSubTitle() -> String {
        switch self {
        case .affiliation: return "어디서 오셨나요?"
        case .career: return "직업을 선택해 주세요!"
        case .school: return "학교를 선택해주세요!"
        case .club: return "가입하신 동아리를 선택해주세요!"
        case .name: return "이름을 입력해주세요!"
        case .admissionNumber: return "입학하신 연도를 입력해주세요!"
        case .studentNumber: return "학년, 반, 번호를 입력해주세요! (ex: 10101)"
        case .phoneNumber: return "전화번호를 입력해주세요!"
        case .email: return "이메일을 입력해주세요!"
        case .password: return "8~24자 이내의 영문 / 숫자, 특수문자 1개 이상"
        case .checkPassword: return "비밀번호를 다시 입력해 주세요!"
        case .company: return "소속하신 기업을 입력해 주세요!"
        case .university: return "소속하신 대학을 입력해 주세요!"
        case .government: return "소속하신 기관을 입력해 주세요!"
        case .sectors: return "소속하신 기관의 업종을 입력해 주세요!"
        case .position: return "본인의 직책을 입력해 주세요!"
        }
    }
}
