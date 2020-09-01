#if !os(macOS)
import UIKit

public extension UINavigationBar {
    func showShadow(visible: Bool) {
        showShadow(opacitiy: visible ? 1 : 0)
    }
    
    func showShadow(opacitiy: Double) {
        let visible = opacitiy >= 1
        if visible {
            shadowImage = nil
            setBackgroundImage(nil, for: .default)
        } else {
            shadowImage = UIColor.clear.withAlphaComponent(CGFloat(opacitiy)).onePx
        }
    }
}

#endif
