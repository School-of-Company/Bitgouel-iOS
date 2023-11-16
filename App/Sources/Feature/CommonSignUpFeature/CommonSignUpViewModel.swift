import Foundation
import Service

final class CommonSignUpViewModel: ObservableObject {
    @Published var association: String = ""
    @Published var school: String = ""
    @Published var external: String = ""
    @Published var associationType: String = "소속"
    @Published var jobType: String = "직업"
    let associationValue: [AssociationType] = AssociationType.allCases
    let schoolValue: [UserRoleType.SchoolType] = UserRoleType.SchoolType.allCases
    let externalValue: [UserRoleType.ExternalType] = UserRoleType.ExternalType.allCases
    
    var titleMessage: String  {
        if associationType == "소속" {
            return "만나서 반가워요!"
        } else {
            return "무슨 일을 하시나요?"
        }
    }
    
    var subtitleMessage: String {
        if associationType == "소속" {
            return "어디서 오셨나요?"
        } else {
            return "직업을 선택해 주세요!"
        }
    }
    
    var getAssociationType: [AssociationType] {
        return associationValue
    }
    
    var getSchoolType: [UserRoleType.SchoolType] {
        return schoolValue
    }
    
    var getExternalType: [UserRoleType.ExternalType] {
        return externalValue
    }
}
