#if !os(macOS)
import UIKit

public extension UIView {
    static var nib: UINib {
        nib(nil)
    }
    
    static func nib(_ bundle: Bundle?) -> UINib {
        UINib(nibName: nibName, bundle: bundle)
    }
    
    static var nibName: String {
        Names.klazzName(self)
    }
}

#endif
