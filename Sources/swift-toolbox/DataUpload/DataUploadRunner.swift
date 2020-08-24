//
//Copyright © 2019 Matthias Hennemeyer. All rights reserved.
//

import Foundation

public class DataUploadRunner: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
    let url: URL
    let data: Data
    let documentType: String
    let headers: [String: String]
    let params: [String: String]
    
    var uploadProgress: ((UploadProgress) -> ())?
    
    init(url: URL, documentType: String, data: Data, headers: [String: String] = [String: String](), params: [String: String] = [String: String]()) {
        self.url = url
        self.data = data
        self.documentType = documentType
        self.headers = headers
        self.params = params
    }
    
    lazy var uploadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Upload queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    func task(progress: @escaping (UploadProgress) -> (), completion: @escaping (DataUploadServiceResponse) -> ()) -> URLSessionTask? {
        self.uploadProgress = progress
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate:self, delegateQueue: uploadQueue)
        
        let task = session.dataTask(with: request()) { data, response, error in
            guard error == nil else { print("UploadService error: \(error!)"); completion(.error); return }
            
            guard let result = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject] else {
                print("UploadService Fail no json result: \(String(data: data!, encoding: .utf8) ?? "No Data")");
                completion(.error)
                return
            }
            
            guard let valueString = result["statusCode"] as? String, let statusCode = Int(valueString) else {
                print("UploadService no json: \(result))")
                completion(.error)
                return
            }
            
            print("Upload Result: \(valueString)")
            
            completion(.success(statusCode: statusCode))
        }
        return task
    }
    
    private func request() -> URLRequest {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = params.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        
        var request = URLRequest(url: components.url!)
        print("DataUpload Url: \(components.url)")
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        var bodyData: Data = Data()
        let boundary = "\(UUID().uuidString)"
        bodyData.append("Content-Type: multipart/form-data; boundary=\(boundary)\r\n".data(using: .utf8)!)
        bodyData.append("--\(boundary)\r\n".data(using: .utf8)!)
        bodyData.append("Content-Disposition: form-data; name=\"file\"; filename=\"video.mp4\"\r\n".data(using: .utf8)!)
        bodyData.append("Content-Type: video/mp4;\r\n\r\n".data(using: .utf8)!)
        bodyData.append(self.data)
        bodyData.append("\r\n".data(using: .utf8)!)
        bodyData.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue(String(bodyData.count), forHTTPHeaderField: "Content-Length")
        request.httpBody = bodyData
        return request
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = UploadProgress.progress(from: Double(totalBytesSent) / Double(totalBytesExpectedToSend))
        self.uploadProgress?(progress)
    }
}
