import Foundation

public enum DataUploadServiceResponse {
    case success(statusCode: Int)
    case error(statusCode: Int)
    
    public var isSuccessful: Bool {
        switch self {
        case .error:
            return false
        default:
            return true
        }
    }
    
    public var isUnauthorized: Bool {
        switch self {
        case let .error(statusCode):
            return statusCode == 401
        default:
            return false
        }
    }
    
    static let clientError = 400
    static let unauthorized = 401
    
    static let serverError = 500
    
    static func fromStatusCode(_ statusCode: Int) -> DataUploadServiceResponse {
        if statusCode > 499 {
            return error(statusCode: serverError)
        } else if statusCode > 399 {
            return error(statusCode: unauthorized)
        } else if statusCode > 199 && statusCode < 300 {
            return success(statusCode: statusCode)
        } else {
            return error(statusCode: statusCode)
        }
    }
}
