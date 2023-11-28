import Foundation
import Moya

public enum ActivityAPI{
}

extension ActivityAPI: BitgouelAPI {
    public var domain: BitgouelDomain {
        .activity
    }
    
    public var urlPath: String {
        switch self {
        }
    }
    
    public var method: Moya.Method {
        switch self {
        }
    }
    
    public var task: Moya.Task {
        switch self {
        }
    }
    
    public var jwtTokenType: JwtTokenType {
        switch self {
            
        }
    }
    
    public var errorMap: [Int: ErrorType] {
        switch self {
            
        }
    }
}
