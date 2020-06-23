import UIKit

public extension UIView {
    static var nib: UINib {
        UINib(nibName: nibName, bundle: nil)
    }
    
    static var nibName: String {
        Names.klazzName(self)
    }
}



