import Foundation

public struct Names {
    static func klazzName(_ obj: AnyClass) -> String {
        let fullName = NSStringFromClass(obj) // 'mainModule.ClassName'
        return String(fullName.split(separator: ".").last!)
    }
}

