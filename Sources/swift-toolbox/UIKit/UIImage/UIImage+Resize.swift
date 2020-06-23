import UIKit

public extension UIImage {
    func resized(to target: CGSize) -> UIImage? {
        let ratio = min(
            target.height / size.height, target.width / size.width
        )
        let new = CGSize(
            width: size.width * ratio, height: size.height * ratio
        )
        UIGraphicsBeginImageContextWithOptions(new, false, 1.0)
        draw(in: CGRect(origin: .zero, size: new))
        defer { UIGraphicsEndImageContext() }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

