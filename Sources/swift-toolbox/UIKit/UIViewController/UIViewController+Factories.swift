import UIKit

@available(iOS 13.0, *)
public extension UIViewController {
    static func fromStoryboard(bundle: Bundle? = nil, name: String? = nil) -> Self {
        let bundle = bundle ?? Bundle(for: self)
        let name = name ?? Names.klazzName(self)
        return UIStoryboard(name: name, bundle: bundle).instantiateViewController(identifier: name) as! Self
    }
    
    static func fromMainStoryboard() -> Self {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: Names.klazzName(self)) as! Self
    }
    
    static func fromXib(bundle: Bundle? = nil) -> Self {
        let bundle = bundle ?? Bundle(for: self)
        var name = Names.klazzName(self)
        if !bundle.isNibExisting(name) {
            name = name.replacingOccurrences(of: "Controller", with: "View")
        }
        return Self.init(nibName: name, bundle: bundle)
    }
    
    convenience init(xib: UIXIBView) {
        self.init()
        xib.controller = self // external reference
        self.view = xib
    }
    
    func inNav() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.viewControllers = [self]
        return navigationController
    }
}



