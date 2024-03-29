import Foundation

// swiftlint: disable identifier_name
public enum HighSchoolType: String, CaseIterable, Decodable, Encodable {
    case gwangjuTechnicalHighSchool = "GWANGJU_TECHNICAL_HIGH_SCHOOL"
    case kumpaTechnicalHighSchool = "KUMPA_TECHNICAL_HIGH_SCHOOL"
    case jeonnamTechnicalHighSchool = "JEONNAM_TECHNICAL_HIGH_SCHOOL"
    case gwangjeGirlsCommercialHighSchool = "GWANGJU_GIRLS_COMMERCIAL_HIGH_SCHOOL"
    case jeonnamGirlsCommercialHighSchool = "JEONNAM_GIRLS_COMMERCIAL_HIGH_SCHOOL"
    case gwangjuNaturalScienceHighSchool = "GWANGJU_NATURAL_SCIENCE_HIGH_SCHOOL"
    case gwangjuElectronicTechnicalHighSchool = "GWANGJU_ELECTRONIC_TECHNICAL_HIGH_SCHOOL"
    case dongilHighSchoolOfFutureScienceHighSchool = "DONGIL_HIGH_SCHOOL_OF_FUTURE_SCIENCE_HIGH_SCHOOL"
    case seojinGirlsHighSchool = "SEOJIN_GIRLS_HIGH_SCHOOL"
    case sunguiScienceTechnologyHighSchool = "SUNGUI_SCIENCE_TECHNOLOGY_HIGH_SCHOOL"
    case songwonGirlsCommercialHighSchool = "SONGWON_GIRLS_COMMERCIAL_HIGH_SCHOOL"
    case gwangjuAutomaticEquipmentTechnicalHighSchool = "GWANGJU_AUTOMATIC_EQUIPMENT_TECHNICAL_HIGH_SCHOOL"
    case gwangjuSoftwareMeisterHighSchool = "GWANGJU_SOFTWARE_MEISTER_HIGH_SCHOOL"
}

// swiftlint: enable identifier_name

public extension HighSchoolType {
    // swiftlint:disable cyclomatic_complexity
    func display() -> String {
        switch self {
        case .gwangjuTechnicalHighSchool: return "광주공업고등학교"
        case .kumpaTechnicalHighSchool: return "금파공업고등학교"
        case .jeonnamTechnicalHighSchool: return "전남공업고등학교"
        case .gwangjeGirlsCommercialHighSchool: return "광주여자상업고등학교"
        case .jeonnamGirlsCommercialHighSchool: return "전남여자상업고등학교"
        case .gwangjuNaturalScienceHighSchool: return "광주자연과학고등학교"
        case .gwangjuElectronicTechnicalHighSchool: return "광주전자공업고등학교"
        case .dongilHighSchoolOfFutureScienceHighSchool: return "동일미래과학고등학교"
        case .seojinGirlsHighSchool: return "서진여자고등학교"
        case .sunguiScienceTechnologyHighSchool: return "숭의과학기술고등학교"
        case .songwonGirlsCommercialHighSchool: return "송원여자상업고등학교"
        case .gwangjuAutomaticEquipmentTechnicalHighSchool: return "광주자동화설비마이스터고등학교"
        case .gwangjuSoftwareMeisterHighSchool: return "광주소프트웨어마이스터고등학교"
        }
    }
}

public extension HighSchoolType {
    func getClubsForSelectedHighSchool() -> [String] {
        switch self {
        case .gwangjuTechnicalHighSchool:
            return CareerClubType.GwangjuTechnicalHighSchool.allCases.map(\.rawValue)
        case .kumpaTechnicalHighSchool:
            return CareerClubType.KumpaTechnicalHighSchool.allCases.map(\.rawValue)
        case .jeonnamTechnicalHighSchool:
            return CareerClubType.JeonnamTechnicalHighSchool.allCases.map(\.rawValue)
        case .gwangjeGirlsCommercialHighSchool:
            return CareerClubType.GwangjeGirlsCommercialHighSchool.allCases.map(\.rawValue)
        case .jeonnamGirlsCommercialHighSchool:
            return CareerClubType.JeonnamGirlsCommercialHighSchool.allCases.map(\.rawValue)
        case .gwangjuNaturalScienceHighSchool:
            return CareerClubType.GwangjuNaturalScienceHighSchool.allCases.map(\.rawValue)
        case .gwangjuElectronicTechnicalHighSchool:
            return CareerClubType.GwangjuElectronicTechnicalHighSchool.allCases.map(\.rawValue)
        case .dongilHighSchoolOfFutureScienceHighSchool:
            return CareerClubType.DongilHighSchoolOfFutureScienceHighSchool.allCases.map(\.rawValue)
        case .seojinGirlsHighSchool:
            return CareerClubType.SeojinGirlsHighSchool.allCases.map(\.rawValue)
        case .sunguiScienceTechnologyHighSchool:
            return CareerClubType.SunguiScienceTechnologyHighSchool.allCases.map(\.rawValue)
        case .songwonGirlsCommercialHighSchool:
            return CareerClubType.SongwonGirlsCommercialHighSchool.allCases.map(\.rawValue)
        case .gwangjuAutomaticEquipmentTechnicalHighSchool:
            return CareerClubType.GwangjuAutomaticEquipmentTechnicalHighSchool.allCases.map(\.rawValue)
        case .gwangjuSoftwareMeisterHighSchool:
            return CareerClubType.GwangjuSoftwareMeisterHighSchool.allCases.map(\.rawValue)
        }
    }
}

// swiftlint: enable cyclomatic_complexity
