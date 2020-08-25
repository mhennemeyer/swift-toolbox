import Foundation

protocol Cancelable {
    func cancel()
}

extension URLSessionTask: Cancelable {}

public class DataUploadService {
    
    public enum DocumentType: String, RawRepresentable {
        case jpeg = "image/jpeg"
    }
    let isTesting: Bool
    let documentType: DocumentType
    let url: URL
    public var emitError: Bool
    
    var task: URLSessionTask?
    var cancelable: Cancelable?
    
    private var headers = [String: String]()
    private var queryParams = [String: String]()
    private var pathComponents = [String]()

    public init(_ url: URL, documentType: DocumentType, isTesting: Bool = false, emitError: Bool = false ) {
        self.isTesting = isTesting
        self.documentType = documentType
        self.url = url
        self.emitError = emitError
    }
    
    public func addHeader(key: String, value: String) {
        headers[key] = value
    }
    
    public func addQueryParam(key: String, value: String) {
        queryParams[key] = value
    }
    
    public func addPathComponent(_ string: String) {
        pathComponents.append(string)
    }

    public func upload(_ uploadData: Data, progress: @escaping (UploadProgress) -> (), completion: @escaping (DataUploadServiceResponse) -> ()) {
        
        guard !isTesting else {
            let runner = TestRunner(emitError: emitError)
            self.cancelable = runner
            runner.run(completion, progress: progress)
            return
        }
        
        let uploadRunner = DataUploadRunner(
            url: self.url,
            documentType: documentType.rawValue,
            data: uploadData,
            headers: headers,
            params: queryParams,
            pathComponents: pathComponents
        )
        
        if let t = uploadRunner.task(progress: progress, completion: completion) {
            self.task = t
            self.cancelable = t
            self.task?.resume()
        } else {
            completion(.error)
        }
    }


    public func cancelUpload() {
        //self.task?.cancel()
        self.cancelable?.cancel()
    }
}





