#if !os(macOS)
import UIKit

public extension UIView {
    var allSubviews: [UIView] {
        let result = [UIView]()
        result.append(subviews)
        for subview in subviews {
            result.append(subview.allSubviews)
        }
        return result
    }
}
#endif
