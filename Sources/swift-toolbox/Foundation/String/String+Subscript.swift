import Foundation

public extension String {
    func stringAt(_ i: Int) -> String {
        return String(Array(self)[i])
    }

    func charAt(_ i: Int) -> Character {
        return Array(self)[i]
    }
    
    subscript(_ i: Int) -> String {
        stringAt(i)
    }
}

