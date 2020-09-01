import Foundation

public class TestRunner: Cancelable {
    let emitError: Bool
    
    init(emitError: Bool) {
        self.emitError = emitError
    }
    
    private var stopRunning = false
    
    func cancel() {
        stopRunning = true
    }
    
    func run(_ completion: @escaping (DataUploadServiceResponse) -> (), progress: @escaping (UploadProgress) -> ()) {
        guard !stopRunning else { return }
        bg {
            if self.stopRunning { return }
            ui { progress(.zero) }
            for i in 1...10 {
                if i == 5 && self.emitError {
                    ui { completion(.error(statusCode: DataUploadServiceResponse.serverError)) }
                    return
                }
                if self.stopRunning { return }
                Thread.sleep(forTimeInterval: 0.3)
                if self.stopRunning { return }
                ui { progress(.progress(from: Double(i) / 10.0)) }
            }
            ui { progress(.done) }
            if self.stopRunning { return }
            let random = Int("\((1...21).shuffled().first!)")!
            ui { completion(.success(statusCode: random)) }
        }
    }
}
