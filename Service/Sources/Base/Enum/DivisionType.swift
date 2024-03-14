import Foundation

public enum DivisionType: String, Decodable {
    case automobileIndustry = "AUTOMOBILE_INDUSTRY"
    case energyIndustry = "ENERGY_INDUSTRY"
    case medicalHealthcare = "MEDICAL_HEALTHCARE"
    case AIConvergence = "AI_CONVERGENCE"
    case cultureIndustry = "CULTURAL_INDUSTRY"
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
