import UIKit
import WebKit

class VenueController: UIViewController {
    unowned var venue: Venue

    lazy var webView: WKWebView = {
        let view = WKWebView(frame: self.view.frame)

        return view
    }()

    init(venue: Venue) {
        self.venue = venue

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.webView)

        self.title = self.venue.title
        self.view.backgroundColor = UIColor.whiteColor()
        print(self.venue.content)
        self.webView.loadHTMLString(self.venue.content!, baseURL: nil)
    }
}