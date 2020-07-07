import Foundation

protocol Cancelable {
    func cancel()
}

extension URLSessionTask: Cancelable {}

public class DataUploadService {
    let isTesting: Bool
    let documentType: String
    let url: URL
    public var emitError: Bool
    
    var task: URLSessionTask?
    var cancelable: Cancelable?
    
    private var headers = [String: String]()

    public init(_ url: URL, documentType: String, isTesting: Bool = false, emitError: Bool = false ) {
        self.isTesting = isTesting
        self.documentType = documentType
        self.url = url
        self.emitError = emitError
    }
    
    public func addHeader(key: String, value: String) {
        headers[key] = value
    }

    public func upload(_ uploadData: Data, progress: @escaping (UploadProgress) -> (), completion: @escaping (DataUploadServiceResponse) -> ()) {
        
        guard !isTesting else {
            let runner = TestRunner(emitError: emitError)
            self.cancelable = runner
            runner.run(completion, progress: progress)
            return
        }
        
        let uploadRunner = DataUploadRunner(url: self.url, documentType: documentType, data: uploadData, headers: headers)
        
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





