import Foundation

extension Bundle {
    func isNibExisting(_ name: String) -> Bool {
        path(forResource: name, ofType: "nib") != nil
    }
}
