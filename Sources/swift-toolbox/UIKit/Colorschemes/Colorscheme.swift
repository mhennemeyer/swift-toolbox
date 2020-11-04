#if !os(macOS)
import UIKit

public class Colorscheme {
    var primaryColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).backgroundColor
    }
    
    var primaryDarkerColor: UIColor {
        primaryColor.darker()
    }
    
    var secondaryColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).textColor
    }
    
    var tertiaryColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).backgroundColor.withAlphaComponent(0.7)
    }
    
    var sectionColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
    var okColor: UIColor {
        // TODO
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
    var warnColor: UIColor {
        // TODO
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
    var grayishColor: UIColor {
        // TODO
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
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
