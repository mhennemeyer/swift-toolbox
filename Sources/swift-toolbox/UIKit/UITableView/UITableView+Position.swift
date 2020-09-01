#if !os(macOS)
import UIKit

public extension UITableView {
    func isTopRow(_ indexPath: IndexPath) -> Bool {
        indexPath.row == 0
    }
    
    func isBottomRowInSection(_ indexPath: IndexPath) -> Bool {
        indexPath.row == ( numberOfRows(inSection: indexPath.section) - 1)
    }
    
    func isSingleRowInSection(_ indexPath: IndexPath) -> Bool {
        isTopRow(indexPath) && isBottomRowInSection(indexPath)
    }
}
#endif
