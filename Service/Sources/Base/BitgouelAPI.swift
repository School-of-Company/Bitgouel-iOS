import Foundation
import Moya

public protocol BitgouelAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: BitgouelDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

public extension BitgouelAPI {
    var baseURL: URL {
        URL(
            string: Bundle.module.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        ) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum BitgouelDomain: String {
    case auth
    case user
    case activity
    case post
    case inquiry
    case faq
    case lecture
    case withdraw
    case admin
    case certification
    case club
    case email
}

extension BitgouelDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}

private class BundleFinder {}

extension Foundation.Bundle {
    static let module = Bundle(for: BundleFinder.self)
}
