import Foundation

public enum LectureType: String, CaseIterable, Decodable, Encodable {
    case mutualCreditRecognitionProgram = "MUTUAL_CREDIT_RECOGNITION_PROGRAM"
    case universityExplorationProgram = "UNIVERSITY_EXPLORATION_PROGRAM"
}

public extension LectureType {
    func display() -> String {
        switch self {
        case .mutualCreditRecognitionProgram: return "상호학점인정교육과정"
        case .universityExplorationProgram: return "대학탐방프로그램"
        }
    }
}
