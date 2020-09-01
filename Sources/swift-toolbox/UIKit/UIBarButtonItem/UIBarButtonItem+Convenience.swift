#if !os(macOS)
import UIKit

public extension UIBarButtonItem {
    convenience init(title: String) {
        self.init(title: title, style: .plain, target: nil, action: nil)
    }
}
#endif
