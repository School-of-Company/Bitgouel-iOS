import Foundation

public enum UserRoleType {
    public enum SchoolType: String, CaseIterable, Decodable, Encodable {
        case student = "ROLE_STUDENT"
        case teacher = "ROLE_TEACHER"
    }

    public enum ExternalType: String, CaseIterable, Decodable, Encodable {
        case companyInstructor = "ROLE_COMPANY_INSTRUCTOR"
        case professor = "ROLE_PROFESSOR"
        case bbozzack = "ROLE_BBOZZAK"
        case grovernment = "ROLE_GOVERNMENT"
    }
}

public extension UserRoleType.SchoolType {
    func schoolValue() -> String {
        switch self {
        case .student: return "학생"
        case .teacher: return "취업동아리 선생님"
        }
    }
}

public extension UserRoleType.ExternalType {
    func externalValue() -> String {
        switch self {
        case .companyInstructor: return "기업 강사"
        case .professor: return "대학 교수"
        case .bbozzack: return "뽀짝 선생님"
        case .grovernment: return "유관 기관"
        }
    }
}
