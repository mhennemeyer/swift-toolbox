import UIKit

public extension UIView {
    func highlight() {
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            guard let self = self else { return }
            self.alpha = 0.5
            
        }) {  [weak self] complete in
            guard let self = self else { return }
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
}

