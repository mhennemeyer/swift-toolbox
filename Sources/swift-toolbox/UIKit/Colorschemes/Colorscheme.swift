#if !os(macOS)
import UIKit

public protocol Colorscheme: class {
    static var shared: Self { get }
    var primaryColor: UIColor { get }
    var primaryDarkerColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var tertiaryColor: UIColor { get }
    var okColor: UIColor { get }
    var warnColor: UIColor { get }
    var grayishColor: UIColor { get }
}

public extension Colorscheme {
    func colorize(cell: UITableViewCell) {
        cell.backgroundColor = primaryColor
        cell.tintColor = secondaryColor
        cell.allSubviews.forEach { subview in
            guard subview.tag != 999 else { return }
            if subview.responds(to: Selector("textColor")) {
                subview.setValue(secondaryColor, forKey: "textColor")
            }
            //subview.tintColor = secondaryColor
        }
    }
    
    func colorize(bar: UINavigationBar?) {
        guard let bar = bar else { return }
        bar.barTintColor = primaryColor
        bar.tintColor = secondaryColor
        bar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : secondaryColor]
    }
    
    func colorize(view: UIView?) {
        guard let view = view else { return }
        view.backgroundColor = primaryDarkerColor
        view.tintColor = secondaryColor
    }
    
    func fullColorize(view: UIView?) {
        guard let view = view else { return }
        view.backgroundColor = primaryDarkerColor
        view.tintColor = secondaryColor
        view.allSubviews.forEach { subview in
            guard subview.tag == 999 else { return }
            fullColorize(view: subview)
        }
    }
}

#endif
