#if !os(macOS)
import UIKit

public extension UICollectionViewCell {
    static func from(collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        collectionView.dequeueReusableCell(withReuseIdentifier: Names.klazzName(self), for: indexPath) as! Self
    }
}

#endif
