import Foundation
import Combine
import XCTest

final class LoginViewModel: ObservableObject {
    @Published private var isPasswordValid = false
    @Published public var isLoading = false
    @Published public var helpMessage = ""
    @Published var email = ""
    @Published var password = ""
    
    var isFormEmpty: Bool {
        email.isEmpty || password.isEmpty
    }
    
    var isPasswordErrorOcuured: Bool {
        isPasswordValid = passwordRegexMatch(password)
        
        if isPasswordValid {
            return true
        } else {
            helpMessage = "잘못된 비밀번호입니다"
            return false
        }
    }
    
    func passwordRegexMatch(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,24}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return predicate.evaluate(with: password)
    }
}
