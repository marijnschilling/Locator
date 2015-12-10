import UIKit

class VenuesHeader: UITableViewHeaderFooterView {
    static let Identifier = "VenuesHeaderIdentifier"

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        self.textLabel?.font = UIFont.bold(14)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}