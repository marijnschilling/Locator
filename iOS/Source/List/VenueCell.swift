import UIKit

class VenueCell: UITableViewCell {
    static let Identifier = "VenueCellIdentifier"

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.textLabel?.font = UIFont.regular(17)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var venue: Venue? {
        didSet {
            self.textLabel?.text = venue?.name ?? ""
        }
    }
}