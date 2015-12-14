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

        let stylingFile = NSBundle.mainBundle().pathForResource("styling", ofType: "html")!
        let stylingString = try! NSString(contentsOfFile: stylingFile, encoding: NSUTF8StringEncoding)
        let displayedContent = NSString(format: stylingString, self.cleanString(self.venue.content!))
        self.webView.loadHTMLString(displayedContent as String, baseURL: nil)
    }

    func cleanString(evaluated: String) -> String {
        let firstRegex = try! NSRegularExpression(pattern: "<p><a href=\"https://rescuejuice.com", options: [])
        let firstResult = firstRegex.stringByReplacingMatchesInString(evaluated, options: [], range: NSMakeRange(0, evaluated.characters.count), withTemplate: "<a href=\"https://rescuejuice.com")

        let secondRegex = try! NSRegularExpression(pattern: "px\" /></a></p>", options: [])
        let secondResult = secondRegex.stringByReplacingMatchesInString(firstResult, options: [], range: NSMakeRange(0, firstResult.characters.count), withTemplate: "px\" /></a>")

        let thirdRegex = try! NSRegularExpression(pattern: "width=\".*\"", options: [])
        let thirdResult = thirdRegex.stringByReplacingMatchesInString(secondResult, options: [], range: NSMakeRange(0, secondResult.characters.count), withTemplate: "width=100%; height=auto;")
        
        return thirdResult
    }
}