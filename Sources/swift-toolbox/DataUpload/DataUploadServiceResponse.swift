import Foundation

public enum DataUploadServiceResponse {
    case success(statusCode: Int)
    case error
    
    public var isSuccessful: Bool {
        switch self {
        case .error:
            return false
        default:
            return true
        }
    }
}
