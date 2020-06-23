import Foundation

public extension Bundle {
    func isNibExisting(_ name: String) -> Bool {
        path(forResource: name, ofType: "nib") != nil
    }
}
