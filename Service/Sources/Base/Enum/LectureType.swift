import Foundation

public enum LectureType: String, CaseIterable, Decodable, Encodable {
    case mutualCreditRecognitionProgram = "상호학점인정교육과정"
    case universityExplorationProgram = "대학탐방프로그램"
    case governmentProgram = "유관기관프로그램"
    case companyIndustryLinkingJobExperienceProgram = "기업산학연계직업체험프로그램"
    case etc = "기타"
}
