import Foundation

public extension Date {
    
    static var aYearAgo: Date {
        Current.calendar.date(
            byAdding: .year,
            value: -1,
            to: Date())!
    }
    
    func startOfMonth() -> Date {
        Current.calendar.date(from: Current.calendar.dateComponents([.year, .month], from: Current.calendar.startOfDay(for: self)))!
    }

    func endOfMonth() -> Date {
        return Current.calendar.date(byAdding: DateComponents(month: 1, hour: -1), to: self.startOfMonth())!
    }
    
    func endOfWeek() -> Date {
        let daysToEndOfWeek = 7 - dayOfWeek
        let date = Current.calendar.date(byAdding: .day, value: daysToEndOfWeek, to: self)!
        return date
    }
    
    var monthName: String {
        DateFormatter().monthSymbols[month - 1]
    }
    
    var year: Int {
        Current.calendar.component(.year, from: self)
    }
    
    var month: Int {
        Current.calendar.component(.month, from: self)
    }
    
    var dayOfMonth: Int {
        Current.calendar.component(.day, from: self)
    }
    
    var dayOfWeek: Int {
        Current.calendar.component(.weekday, from: self)
    }
    
    var isToday: Bool {
        Current.calendar.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        Current.calendar.isDateInToday(self.dayAfter)
    }
    
    var isFuture: Bool {
        self > Date()
    }
    
    var dayBefore: Date {
        Current.calendar.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        Current.calendar.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        Current.calendar.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    
    var midnight: Date {
        Current.calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    
    var beforeNextMidnight: Date {
        Current.calendar.date(bySettingHour: 23, minute: 59, second: 0, of: self)!
    }
    
    var afterMidnight: Date {
        Current.calendar.date(bySettingHour: 0, minute: 1, second: 0, of: self)!
    }
}
