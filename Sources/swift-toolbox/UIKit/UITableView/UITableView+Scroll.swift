import UIKit

public extension UITableView {
    func scrollDown() {
        setContentOffset(CGPoint(x: 0, y: CGFloat.greatestFiniteMagnitude), animated: false)
    }
}
