#if !os(macOS)
import UIKit

@available(iOS 13.0, *)
public extension UIViewController {
    static func fromStoryboard(bundle: Bundle? = nil, name: String? = nil) -> Self {
        print("fromStoryboard load \(Self.self) from Storyboard")
        let bundle = bundle ?? Bundle(for: self)
        print("fromStoryboard bundle: \(bundle)")
        if !bundle.isLoaded {
            bundle.load()
        }
        let name = name ?? Names.klazzName(self)
        print("fromStoryboard name: \(name)")
        let ctrl = UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController()
        print("fromStoryboard ctrl: \(ctrl)")
        return ctrl as! Self
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



#endif
