import Foundation

public protocol Tagged {
    var tags: [String] { get }
    var withoutTags: String { get }
    func matches(for pattern: String) -> [String]
    var taggedContent: String { get }
}

public extension Tagged {
    
    var tags: [String] {
        taggedContent.matches(for: " @\\w+")
            .map(removingATs)
            .map(removingSpaces)
    }
    
    func matches(for pattern: String) -> [String] {
        taggedContent.matches(for: pattern)
    }
    
    private func removingATs(string: String) -> String {
        string.replacingOccurrences(of: "@", with: "")
    }
    
    private func removingSpaces(string: String) -> String {
        string.replacingOccurrences(of: " ", with: "")
    }
    
    var withoutTags: String {
        tags.reduce(taggedContent, removeTag)
    }
    
    private func removeTag(from string: String?, tag: String) -> String {
        string?.replacingOccurrences(of: " @\(tag)", with: "") ?? ""
    }
}
