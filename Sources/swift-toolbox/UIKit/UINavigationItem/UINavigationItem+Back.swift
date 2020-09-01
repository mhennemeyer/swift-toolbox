#if !os(macOS)
import UIKit

public extension UINavigationItem {
    func setBackTitle(_ backTitle: String) {
        self.backBarButtonItem = UIBarButtonItem(title: backTitle)
    }
}
#endif
