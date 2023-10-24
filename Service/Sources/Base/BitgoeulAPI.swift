import Foundation
import Moya

public protocol BitgoeulAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: BitgoeulDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

public extension BitgoeulAPI {
    var baseURL: URL {
        URL(
            string: Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        ) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum BitgoeulDomain: String {
    case auth
    case user
    case activity
    case post
    case inquery
    case faq
    case lecture
    case withdraw
    case admin
}

extension BitgoeulDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
