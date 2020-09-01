#if !os(macOS)
import UIKit

public extension Bundle {
    var appIcon: UIImage {
        if let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last {
            return UIImage(named: lastIcon) ?? UIImage()
        }
        return UIImage()
    }
    
    var alternateIcons: [String] {
        if let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
            let alter = icons["CFBundleAlternateIcons"] as? [String: Any] {
            return Array(alter.keys)
        }
        return [String]()
    }
}
#endif
