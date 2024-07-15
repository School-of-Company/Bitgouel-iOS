import Foundation

public enum LineType: String, Codable {
    case industry = "INDUSTRY"
    case commerce = "COMMERCE"
    case agriculturalLifeHealthCare = "AGRICULTURAL_LIFE_HEALTH_CARE"
    case customizedIndustrialDemand = "CUSTOMIZED_INDUSTRIAL_DEMAND"
}

public extension LineType {
    func display() -> String {
        switch self {
        case .industry: return "공업계열"
        case .commerce: return "상업계열"
        case .agriculturalLifeHealthCare: return "농업생명/보건의료계열"
        case .customizedIndustrialDemand: return "산업수요 맞춤형계열"
        }
    }
}
