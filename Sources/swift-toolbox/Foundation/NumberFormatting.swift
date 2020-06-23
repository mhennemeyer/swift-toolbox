import Foundation

public extension Int {
    func format(f: String) -> String {
        return String(format: "%\(f)d", self)
    }
}

public extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
