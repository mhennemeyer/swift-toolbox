//
//Copyright © 2019 Matthias Hennemeyer. All rights reserved.
//

import Foundation

public class DataUploadRunner: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
    let url: URL
    let data: Data
    let documentType: String
    let filename: String
    let headers: [String: String]
    let params: [String: String]
    let pathComponents: [String]
    
    var uploadProgress: ((UploadProgress) -> ())?
    
    init(url: URL, documentType: String, filename: String, data: Data, headers: [String: String] = [String: String](), params: [String: String] = [String: String](), pathComponents: [String] = [String]()) {
        self.url = url
        self.data = data
        self.documentType = documentType
        self.filename = filename
        self.headers = headers
        self.params = params
        self.pathComponents = pathComponents
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
            guard error == nil else { print("UploadService error: \(error!)"); completion(.error(statusCode: DataUploadServiceResponse.serverError)); return }
            
            guard let json = (try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]) else {
                print("UploadService Fail no json result: \(String(data: data!, encoding: .utf8) ?? "No Data")");
                completion(.error(statusCode: DataUploadServiceResponse.serverError))
                return
            }
            
            print("Data Upload Json: \(json)")
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.error(statusCode: DataUploadServiceResponse.serverError))
                return
            }
            print("Data upload statusCode: \(httpResponse.statusCode)")
            guard httpResponse.statusCode < 300 && httpResponse.statusCode > 199 else {
                completion(DataUploadServiceResponse.fromStatusCode(httpResponse.statusCode))
                return
            }
            
            
            completion(.success(statusCode: httpResponse.statusCode))
        }
        return task
    }
    
    private func request() -> URLRequest {
        
        var fullUrl = url
        
        pathComponents.forEach { path in
            fullUrl = fullUrl.appendingPathComponent(path)
        }
        
        var components = URLComponents(url: fullUrl, resolvingAgainstBaseURL: false)!
        components.queryItems = params.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        
        var request = URLRequest(url: components.url!)
        print("DataUpload Url: \(components.url!)")
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        var bodyData: Data = Data()
        let boundary = "\(UUID().uuidString)"
        bodyData.append("Content-Type: multipart/form-data; boundary=\(boundary)\r\n".data(using: .utf8)!)
        bodyData.append("--\(boundary)\r\n".data(using: .utf8)!)
        bodyData.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        bodyData.append("Content-Type: \(self.documentType);\r\n\r\n".data(using: .utf8)!)
        bodyData.append(self.data)
        bodyData.append("\r\n".data(using: .utf8)!)
        bodyData.append("--\(boundary)--\r\n".data(using: .utf8)!)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue(String(bodyData.count), forHTTPHeaderField: "Content-Length")
        request.httpBody = bodyData
        print("request: \(request)")
        return request
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = UploadProgress.progress(from: Double(totalBytesSent) / Double(totalBytesExpectedToSend))
        self.uploadProgress?(progress)
    }
}
