import Foundation

final class LoginViewModel: ObservableObject {
    @Published private var isEmailValid = false
    @Published private var isPasswordValid = false
    @Published public var isLoading = false
    @Published public var emailHelpMessage = ""
    @Published public var passwordHelpMessage = "비밀번호를 잊었나요?"
    @Published var email = ""
    @Published var password = ""
    
    var isFormEmpty: Bool {
        email.isEmpty || password.isEmpty
    }
    
    var isEmailErrorOccured: Bool {
        isEmailValid = checkEmail(email)
        
        if isEmailValid {
            return true
        } else {
            emailHelpMessage = "잘못된 이메일입니다."
            return false
        }
    }
    
    var isPasswordErrorOcuured: Bool {
        isPasswordValid = checkPassword(password)
        
        if isPasswordValid {
            return true
        } else {
            passwordHelpMessage = "잘못된 비밀번호입니다"
            return false
        }
    }
    
    func checkEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func checkPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,24}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}