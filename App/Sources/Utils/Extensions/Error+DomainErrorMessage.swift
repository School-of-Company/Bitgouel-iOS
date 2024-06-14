import Foundation
import Service

extension Error {
    var unknownErrorMessage: String {
        "알 수 없는 오류가 발생했습니다."
    }

    func authDomainErrorMessage() -> String {
        if let authDomainError = self as? AuthDomainError {
            return authDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func activityDomainErrorMessage() -> String {
        if let activityDomainError = self as? ActivityDomainError {
            return activityDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func adminDomainErrorMessage() -> String {
        if let adminDomainError = self as? AdminDomainError {
            return adminDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func certificationDomainErrorMessage() -> String {
        if let certificationDomainError = self as? CertificationDomainError {
            return certificationDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func clubDomainErrorMessage() -> String {
        if let clubDomainError = self as? ClubDomainError {
            return clubDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func emailDomainErrorMessage() -> String {
        if let emailDomainError = self as? EmailDomainError {
            return emailDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func faqDomainErrorMessage() -> String {
        if let faqDomainError = self as? FAQDomainError {
            return faqDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func inquiryDomainErrorMessage() -> String {
        if let inquiryDomainError = self as? InquiryDomainError {
            return inquiryDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func lectureDomainErrorMessage() -> String {
        if let lectureDomainError = self as? LectureDomainError {
            return lectureDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func postDomainErrorMessage() -> String {
        if let postDomainError = self as? PostDomainError {
            return postDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func userDomainErrorMessage() -> String {
        if let userDomainError = self as? UserDomainError {
            return userDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }

    func withdrawDomainErrorMessage() -> String {
        if let withdrawDomainError = self as? WithdrawDomainError {
            return withdrawDomainError.errorDescription ?? unknownErrorMessage
        } else { return unknownErrorMessage }
    }
}
