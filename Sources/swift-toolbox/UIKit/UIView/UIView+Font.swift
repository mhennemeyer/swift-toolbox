import UIKit

@available(iOS 13.0, *)
public extension UIView {
    func makeFontRounded() {
        let setter = Selector("setFont:")
        let getter = Selector("font")
        if responds(to: setter), responds(to: getter), let f = perform(getter)?.takeUnretainedValue() as? UIFont {
            perform(setter, with: f.rounded)
        }
    }
}

