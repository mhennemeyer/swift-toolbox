#if !os(macOS)
import UIKit

public extension UIViewController {
    func embed(_ ctrl: UIViewController, into container: UIView, at index: Int? = nil) {
        ctrl.view.frame = container.bounds
        embed(ctrl)
        if let index = index {
            container.insertSubview(ctrl.view, at: index)
        } else {
            container.addSubview(ctrl.view)
        }
    }
    
    func embed(_ ctrl: UIViewController) {
        addChild(ctrl)
        ctrl.didMove(toParent: self)
    }
}

#endif
