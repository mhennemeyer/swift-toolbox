import Foundation

public extension DateFormatter {
    convenience init(style: DateFormatter.Style) {
        self.init()
        self.dateStyle = style
    }
    
    static var weekDay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }
}
