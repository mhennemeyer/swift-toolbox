import UIKit

public extension UITableViewCell {
    static func from(tableView: UITableView, indexPath: IndexPath? = nil) -> Self {
        if let indexPath = indexPath {
            return tableView.dequeueReusableCell(withIdentifier: Names.klazzName(self), for: indexPath) as! Self
        } else {
            return tableView.dequeueReusableCell(withIdentifier: Names.klazzName(self)) as! Self
        }
    }
}

