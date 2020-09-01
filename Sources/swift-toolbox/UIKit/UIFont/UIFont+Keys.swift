#if !os(macOS)
import UIKit

@available(iOS 13.0, *)
public extension UIFont {
    
    /// Returns a new font with the weight specified
    /// - Parameter weight: The new font weight
    func withWeight(_ weight: UIFont.Weight) -> UIFont {
        let newDescriptor = fontDescriptor.addingAttributes([.traits: [
            UIFontDescriptor.TraitKey.weight: weight]
        ])
        return UIFont(descriptor: newDescriptor, size: pointSize)
    }
    
    /// Returns a new font with the weight specified
    /// - Parameter weight: The new font weight
    var rounded: UIFont? {
        if let d = fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: d, size: pointSize)
        }
        return nil
    }
}
#endif
