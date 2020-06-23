import Foundation

public func bg(work: @escaping () -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
        work()
    }
}

public func ui(work: @escaping () -> ()) {
    guard !Thread.isMainThread else {
        work()
        return
    }
    
    DispatchQueue.main.async {
        work()
    }
}

public func ui(after time: Double, work: @escaping () -> ()) {    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        work()
    }
}
