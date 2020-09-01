#if !os(macOS)
import UIKit

public extension UIPageViewController {
    var isScrolling: Bool {
        self.view.frame.size.width != scrollView!.contentOffset.x
    }
    
    var scrollView: UIScrollView? {
        var retVal: UIScrollView? = nil
        self.view.subviews.forEach {
            if let sv = $0 as? UIScrollView {
                retVal = sv
            }
        }
        return retVal
    }
}
#endif
