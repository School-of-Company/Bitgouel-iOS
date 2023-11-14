import Foundation

public enum UserRoleType {
    public enum SchoolType: String, CaseIterable, Decodable, Encodable {
        case student = "학생"
        case teacher = "취업동아리 선생님"
    }
    
    public enum ExternalType: String, CaseIterable, Decodable, Encodable {
        case companyInstructor = "기업 강사"
        case professor = "대학 교수"
        case bbozzack = "뽀짝 선생님"
        case grovernment = "유관 기관"
    }
}
