import Foundation

// swiftlint: disable identifier_name
public enum CareerClubType {
    public enum GwangjuTechnicalHighSchool: String, CaseIterable, Decodable, Encodable {
        case smartJobProject = "SMART JOB PROJECT"
        case 나의미래는내가주인공이다 = "나의 미래는 내가 주인공이다!"
        case 설비의달인 = "설비의 달인"
        case 특수용접화이팅 = "특수용접 화이팅"
        case 전기가미래다 = "전기가 미래다"
        case 전자어벤져스 = "전자 어벤져스"
        case 전자히어로스 = "전자 히어로스"
        case Civil마스터 = "Civil 마스터"
        case 건축연구소 = "건축연구소"
    }

    public enum KumpaTechnicalHighSchool: String, CaseIterable, Decodable, Encodable {
        case 레프리 = "레프리"
        case 블라썸 = "블라썸"
        case 유선통신 = "유선통신"
        case 전기꿈나무 = "전기꿈나무"
        case 어썸 = "어썸"
        case 다이나믹 = "다이나믹"
        case 금호로80베이커리 = "금호로80 베이커리"
    }

    // swiftlint: disable redundant_string_enum_value
    public enum JeonnamTechnicalHighSchool: String, CaseIterable, Decodable, Encodable {
        case 진짜기계 = "진짜기계"
        case 핫앤쿨 = "핫앤쿨"
        case 에너지지키미 = "에너지지키미"
        case 라온하제 = "라온하제"
        case 스카이드론 = "스카이드론"
        case 그린라이트 = "그린라이트"
    }

    public enum GwangjeGirlsCommercialHighSchool: String, CaseIterable, Decodable, Encodable {
        case 금융실무 = "금융실무"
        case 소개팅 = "소개팅"
        case 취사모 = "취사모"
    }

    public enum JeonnamGirlsCommercialHighSchool: String, CaseIterable, Decodable, Encodable {
        case 없음 = "없음"
    }

    public enum GwangjuNaturalScienceHighSchool: String, CaseIterable, Decodable, Encodable {
        case DCT = "DCT"
        case 뉴쿡 = "뉴쿡"
        case 베이커리카페CEO = "베이커리 카페 CEO"
        case 우아행 = "우아행"
    }

    public enum GwangjuElectronicTechnicalHighSchool: String, CaseIterable, Decodable, Encodable {
        case 감성기계 = "감성기계"
        case 열정그자체 = "열정 그 자체"
        case ACT = "ACT"
        case ECT = "ECT"
        case Tesla = "Tesla"
        case 발자국 = "발자국"
        case 메이커연구소 = "M lab"
    }

    // swiftlint: disable type_name
    public enum DongilHighSchoolOfFutureScienceHighSchool: String, CaseIterable, Decodable, Encodable {
        case 놀고잡고 = "놀고잡고"
        case 믿고잡고 = "믿고잡고"
        case 따고잡고 = "따고잡고"
        case 쓰고잡고 = "쓰고잡고"
        case 하고잡고 = "하고잡고"
    }

    public enum SeojinGirlsHighSchool: String, CaseIterable, Decodable, Encodable {
        case 없음 = "없음"
    }

    public enum SunguiScienceTechnologyHighSchool: String, CaseIterable, Decodable, Encodable {
        case 서전트스나이퍼 = "서전트스나이퍼"
        case 카페인팅 = "카-페인팅"
        case 드림온 = "드림온"
        case 볼트와암페어 = "볼트와 암페어"
        case 크로스핏마스터 = "크로스핏마스터"
        case 비상 = "비상"
        case 캐치어드론 = "캐치어드론"
        case 내빵네빵 = "내빵네빵"
        case 카페바리 = "카페바리"
        case 쿠킹마스터즈 = "쿠킹마스터즈"
    }

    public enum SongwonGirlsCommercialHighSchool: String, CaseIterable, Decodable, Encodable {
        case 건강지킴이 = "건강지킴이"
        case 미용서비스 = "미용서비스"
        case 뷰티아트 = "뷰티아트"
        case 클로즈업 = "클로즈업"
    }

    public enum GwangjuAutomaticEquipmentTechnicalHighSchool: String, CaseIterable, Decodable, Encodable {
        case HMI동아리 = "HMI동아리"
        case 마취제 = "마취제"
        case 빛go = "빛go job go"
        case 취업진로동아리 = "취업진로 동아리"
    }

    public enum GwangjuSoftwareMeisterHighSchool: String, CaseIterable, Decodable, Encodable {
        case devGSM = "dev GSM"
    }
}

// swiftlint: enable identifier_name
// swiftlint: enable type_name
// swiftlint: enable redundant_string_enum_value
