import Foundation

public extension String {
    func matches(for pattern: String) -> [String] {
        results(pattern)?.map(stringFromResult) ?? []
    }
    
    private func stringFromResult(result: NSTextCheckingResult) -> String {
        String(self[Range(result.range, in: self)!])
    }
    
    private func regex(_ pattern: String) -> NSRegularExpression? {
        try? NSRegularExpression(pattern: pattern)
    }
    
    private func results(_ pattern: String) -> [NSTextCheckingResult]? {
        regex(pattern)?.matches(in: self, range: fullRange)
    }
    
    private var fullRange: NSRange { NSRange(self.startIndex..., in: self) }
}

