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

public enum AdminUserListAuthorityType: String, CaseIterable, Decodable, Encodable {
    case admin = "ROLE_ADMIN"
    case student = "ROLE_STUDENT"
    case teacher = "ROLE_TEACHER"
    case professor = "ROLE_PROFESSOR"
    case government = "ROLE_GOVERNMENT"
    case companyInstructor = "ROLE_COMPANY_INSTRUCTOR"
    case bbozzack = "ROLE_BBOZZAK"
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

public extension AdminUserListAuthorityType {
    func adminUserListValue() -> String {
        switch self {
        case .admin: return "관리자"
        case .student: return "학생"
        case .teacher: return "선생님"
        case .professor: return "대학 교수"
        case .government: return "교육청"
        case .companyInstructor: return "기업 강사"
        case .bbozzack: return "뽀짝 선생님"
        }
    }
}

public extension UserAuthorityType {
    func display() -> String {
        switch self {
        case .user: return "default"
        case .admin: return "어드민"
        case .student: return "학생"
        case .teacher: return "취동쌤"
        case .companyInstructor: return "기업 강사"
        case .professor: return "대학 교수"
        case .bbozzack: return "뽀짝쌤"
        case .government: return "유관 기관"
        }
    }
}
