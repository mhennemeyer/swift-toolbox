#if !os(macOS)
import UIKit

public extension UIView {
    var allSubviews: [UIView] {
        var result = [UIView]()
        result.append(contentsOf: subviews)
        for subview in subviews {
            result.append(contentsOf: subview.allSubviews)
        }
        return result
    }
}
#endif
