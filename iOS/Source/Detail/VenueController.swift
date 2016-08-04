import UIKit
import WebKit
import MapKit

class VenueController: UIViewController {
    unowned var venue: Venue
    unowned var fetcher: Fetcher

    lazy var backgroundView: UIImageView = {
        let view = UIImageView(frame: self.view.frame)
        view.contentMode = .ScaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = UIColor.blackColor()

        return view
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton(type: .Custom)
        button.frame = CGRect(x: 5, y: 20, width: 45, height: 45)
        button.setImage(UIImage(named: "close"), forState: .Normal)
        button.addTarget(self, action: #selector(VenueController.closePressed), forControlEvents: .TouchUpInside)

        return button
    }()

    lazy var titleLabel: UILabel = {
        let bounds = UIScreen.mainScreen().bounds
        let label = UILabel(frame: CGRect(x: 0, y: 60, width: bounds.width, height: 80))
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.bold(22)

        return label
    }()

    lazy var locationLabel: UILabel = {
        let bounds = UIScreen.mainScreen().bounds
        let label = UILabel(frame: CGRect(x: 0, y: 110, width: bounds.width, height: 40))
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.detailBookItalic(16)

        return label
    }()

    lazy var descriptionTextView: UITextView = {
        let bounds = UIScreen.mainScreen().bounds
        let view = UITextView(frame: CGRect(x: 40, y: 200, width: bounds.width - 80, height: 210))
        view.font = UIFont.detailBook(18)
        view.backgroundColor = UIColor.clearColor()
        view.textColor = UIColor.whiteColor()
        view.editable = false
        view.textAlignment = .Center
        view.scrollEnabled = false

        return view
    }()

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    init(fetcher: Fetcher, venue: Venue) {
        self.fetcher = fetcher
        self.venue = venue

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.backgroundView)

        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.locationLabel)
        self.view.addSubview(self.descriptionTextView)

        self.titleLabel.text = self.venue.name
        self.locationLabel.text = self.venue.address
        self.descriptionTextView.text = self.venue.venueDescription
    }

    func closePressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}