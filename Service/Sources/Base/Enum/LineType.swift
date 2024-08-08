import Foundation

public enum LineType: String, Codable, CaseIterable {
    case customizedIndustrialDemand = "CUSTOMIZED_INDUSTRIAL_DEMAND"
    case industry = "INDUSTRY"
    case commerce = "COMMERCE"
    case agriculturalLifeHealthCare = "AGRICULTURAL_LIFE_HEALTH_CARE"
}

public extension LineType {
    func display() -> String {
        switch self {
        case .customizedIndustrialDemand: return "I. 산업수요 맞춤형"
        case .industry: return "II. 공업계열"
        case .commerce: return "III. 상업계열"
        case .agriculturalLifeHealthCare: return "IV. 농업생명/보건의료계열"
        }
    }
}
