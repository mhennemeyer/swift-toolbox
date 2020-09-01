#if !os(macOS)
import UIKit

public extension UIColor {
    convenience init(patternImage: UIImage, tintColor: UIColor) {
        var image = patternImage.withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(patternImage.size,
                                               false,
                                               patternImage.scale)
        tintColor.set()
        image.draw(in: CGRect(x: 0, y: 0,
                              width: patternImage.size.width,
                              height: patternImage.size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.init(patternImage: image)
    }
}
#endif
