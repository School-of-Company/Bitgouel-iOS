import Foundation

public enum UserAuthorityType: String, CaseIterable, Decodable, Encodable {
    case user = "ROLE_USER"
    case admin = "ROLE_ADMIN"
    case student = "ROLE_STUDENT"
    case teacher = "ROLE_TEACHER"
    case companyInstructor = "ROLE_COMPANY_INSTRUCTOR"
    case professor = "ROLE_PROFESSOR"
    case bbozzack = "ROLE_BBOZZAK"
    case government = "ROLE_GOVERNMENT"
}

public enum SchoolUserAuthorityType: String, CaseIterable, Decodable, Encodable {
    case student = "ROLE_STUDENT"
    case teacher = "ROLE_TEACHER"
}

public enum ExternalUserAuthorityType: String, CaseIterable, Decodable, Encodable {
    case companyInstructor = "ROLE_COMPANY_INSTRUCTOR"
    case professor = "ROLE_PROFESSOR"
    case bbozzack = "ROLE_BBOZZAK"
    case government = "ROLE_GOVERNMENT"
}

public extension SchoolUserAuthorityType {
    func schoolValue() -> String {
        switch self {
        case .student: return "학생"
        case .teacher: return "취업동아리 선생님"
        }
    }
}

public extension ExternalUserAuthorityType {
    func externalValue() -> String {
        switch self {
        case .companyInstructor: return "기업 강사"
        case .professor: return "대학 교수"
        case .bbozzack: return "뽀짝 선생님"
        case .government: return "유관 기관"
        }
    }
}
