import Foundation

public enum SemesterType: String, CaseIterable, Decodable, Encodable {
    case firstYearFallSemester = "FIRST_YEAR_FALL_SEMESTER"
    case secondYearSpringSemester = "SECOND_YEAR_SPRING_SEMESTER"
    case secondYearFallSemester = "SECOND_YEAR_FALL_SEMESTER"
    case thirdYearSpringSemester = "THIRD_YEAR_SPRING_SEMESTER"
}

public extension SemesterType {
    func display() -> String {
        switch self {
        case .firstYearFallSemester: return "1학년 2학기"
        case .secondYearSpringSemester: return "2학년 1학기"
        case .secondYearFallSemester: return "2학년 2학기"
        case .thirdYearSpringSemester: return "3학년 1학기"
        }
    }
}
