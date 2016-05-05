import UIKit

class VenuesHeader: UITableViewHeaderFooterView {
    static let Identifier = "VenuesHeaderIdentifier"

    /*
    UITableViewHeaderFooterView does nasty things to the provided UITextLabel, like changing the color and the font.
    This method isn't the optimal place to put this logic, but so far it's the only one that provides the required functionality.
    */
    override func layoutSubviews() {
        super.layoutSubviews()

        self.textLabel?.font = UIFont.semiBold(15)
    }
}