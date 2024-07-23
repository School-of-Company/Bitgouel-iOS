import Foundation

public enum FieldType: String, Codable, CaseIterable {
    case futuristicTransportationEquipment = "FUTURISTIC_TRANSPORTATION_EQUIPMENT"
    case energy = "ENERGY"
    case medicalHealthcare = "MEDICAL_HEALTHCARE"
    case aiConvergence = "AI_CONVERGENCE"
    case culture = "CULTURE"
}

public extension FieldType {
    func display() -> String {
        switch self {
        case .futuristicTransportationEquipment: return "미래형 운송기기"
        case .energy: return "에너지 산업"
        case .medicalHealthcare: return "의료 헬스케어"
        case .aiConvergence: return "AI 융복합"
        case .culture: return "문화산업"
        }
    }
}
