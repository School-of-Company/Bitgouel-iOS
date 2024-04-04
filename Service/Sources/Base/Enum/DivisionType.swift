import Foundation

public enum DivisionType: String, CaseIterable, Decodable, Encodable {
    case automobileIndustry = "AUTOMOBILE_INDUSTRY"
    case energyIndustry = "ENERGY_INDUSTRY"
    case medicalHealthcare = "MEDICAL_HEALTHCARE"
    case AIConvergence = "AI_CONVERGENCE"
    case cultureIndustry = "CULTURAL_INDUSTRY"
}

public enum IndustryDivisionType: String, CaseIterable, Decodable, Encodable {
    case automobileIndustry = "AUTOMOBILE_INDUSTRY"
    case energyIndustry = "ENERGY_INDUSTRY"
    case cultureIndustry = "CULTURAL_INDUSTRY"
}

public enum OtherDivisionType: String, CaseIterable, Decodable, Encodable {
    case medicalHealthcare = "MEDICAL_HEALTHCARE"
    case AIConvergence = "AI_CONVERGENCE"
}

public extension DivisionType {
    func display() -> String {
        switch self {
        case .automobileIndustry: return "자동차 산업"
        case .energyIndustry: return "에너지 산업"
        case .medicalHealthcare: return "의료헬스케어"
        case .AIConvergence: return "AI 융복합"
        case .cultureIndustry: return "문화산업"
        }
    }
}

public extension IndustryDivisionType {
    func display() -> String {
        switch self{
        case .automobileIndustry: return "자동차 산업"
        case .energyIndustry: return "에너지 산업"
        case .cultureIndustry: return "문화산업"
        }
    }
}

public extension OtherDivisionType {
    func display() -> String {
        switch self {
        case .medicalHealthcare: return "의료헬스케어"
        case .AIConvergence: return "AI 융복합"
        }
    }
}
