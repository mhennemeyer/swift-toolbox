#if !os(macOS)
import UIKit

public class Colorscheme {
    public static var primaryColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).backgroundColor
    }
    
    public static var primaryDarkerColor: UIColor {
        primaryColor.darker()
    }
    
    public static var secondaryColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).textColor
    }
    
    public static var tertiaryColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).backgroundColor.withAlphaComponent(0.7)
    }
    
    public static var sectionColor: UIColor {
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
    public static var okColor: UIColor {
        // TODO
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
    public static var warnColor: UIColor {
        // TODO
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
    public static var grayishColor: UIColor {
        // TODO
        MHColorScheme.colorSchemeBy(name: ColorschemeDefault.boardColorString!).sectionColor
    }
    
    public static func colorize(cell: UITableViewCell) {
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
    
    public static func colorize(bar: UINavigationBar?) {
        guard let bar = bar else { return }
        bar.barTintColor = primaryColor
        bar.tintColor = secondaryColor
        bar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : secondaryColor]
    }
    
    public static func colorize(view: UIView?) {
        guard let view = view else { return }
        view.backgroundColor = primaryDarkerColor
        view.tintColor = secondaryColor
    }
    
    public static func fullColorize(view: UIView?) {
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
