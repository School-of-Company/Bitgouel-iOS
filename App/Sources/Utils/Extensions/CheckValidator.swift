import Foundation

extension String {
    public func checkEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    public func checkPassword() -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,24}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }

    public func checkphoneNumber() -> Bool {
        let phoneNumberRegex = "^010\\d{8}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex).evaluate(with: self)
    }
}
