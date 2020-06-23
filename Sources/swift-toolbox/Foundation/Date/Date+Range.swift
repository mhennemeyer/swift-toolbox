import Foundation

public extension Date {
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate

        while date <= toDate {
            dates.append(date)
            guard let newDate = Current.calendar.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
    static func times(from fromDate: Date, to toDate: Date, slice: Int = 24) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        let value = 24 / slice
        while date <= toDate {
            dates.append(date)
            guard let newDate = Current.calendar.date(byAdding: .hour, value: value, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
    static func roundBetween(date1: Date, date2: Date) -> Date {
        
        let between = Date(timeIntervalSince1970: date1.timeIntervalSince1970 + (date2.timeIntervalSince1970 - date1.timeIntervalSince1970) / 2)
        
        return between
    }
}
