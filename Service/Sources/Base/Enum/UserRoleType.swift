import Foundation

public enum UserRoleType: String, Decodable {
    case admin = "ROLE_ADMIN"
    case student = "ROLE_STUDENT"
    case teacher = "ROLE_TEACHER"
    case bbozzack = "ROLE_BBOZZAK"
    case professor = "ROLE_PROFESSOR"
    case companyInstructor = "ROLE_COMPANY_INSTRUCTOR"
    case groverment = "ROLE_GOVERNMENT"
}
