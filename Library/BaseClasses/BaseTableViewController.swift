import UIKit

class BaseTableViewController: UIViewController {
    var fetcher: Fetcher

    var tableView: UITableView {
        return self.view as! UITableView
    }

    init(fetcher: Fetcher) {
        self.fetcher = fetcher

        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        let view = UITableView(frame: UIScreen.mainScreen().bounds)
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.view = view
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let bounds = UIScreen.mainScreen().bounds
        self.tableView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
