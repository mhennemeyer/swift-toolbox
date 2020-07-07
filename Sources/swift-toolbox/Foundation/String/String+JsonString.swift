import Foundation

public extension String {
    var jsonString: String {
        if let jsonData = try? JSONEncoder().encode(self), var jsonString = String(data: jsonData, encoding: .utf8) {
            jsonString.removeFirst()
            jsonString.removeLast()
            return jsonString
        }
        return ""
    }
}
