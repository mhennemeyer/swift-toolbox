import UIKit

public extension UIImage {
    func roundedImage(cornerRadius: Double = 12.0) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let path = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height),
            cornerRadius: CGFloat(cornerRadius))
        
//        let context = UIGraphicsGetCurrentContext()!

        path.addClip()
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        print("appicon newImage \(newImage)")
        return newImage ?? self
    }
}

