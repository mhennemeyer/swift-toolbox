import Foundation

public enum UploadProgress {
    case zero, progress(Float), done
    
    static func progress(from progressValue: Double) -> UploadProgress {
        if progressValue == 0 { return .zero }
        if progressValue == 1 { return .done}
        return progress(Float(progressValue))
    }
}
