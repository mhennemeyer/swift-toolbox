import UIKit

public extension UIKeyCommand {
    
    var repeatableConstant: String {
        "repeatable"
    }
    var nonRepeating: UIKeyCommand {
        if self.responds(to: Selector(repeatableConstant)) {
            self.setValue(false, forKey: repeatableConstant)
        }
        return self
    }
    
    var repeating: UIKeyCommand {
        if self.responds(to: Selector(repeatableConstant)) {
            self.setValue(true, forKey: repeatableConstant)
        }
        return self
    }
}

