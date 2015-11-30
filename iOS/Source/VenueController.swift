import UIKit

class VenueController: UIViewController {
    unowned var venue: Venue

    init(venue: Venue) {
        self.venue = venue

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.venue.title
        self.view.backgroundColor = UIColor.whiteColor()
    }
}