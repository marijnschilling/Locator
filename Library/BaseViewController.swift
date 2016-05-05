import UIKit

class BaseViewController: UIViewController {
    internal var fetcher: Fetcher

    // MARK: - Initializers

    init(fetcher: Fetcher) {
        self.fetcher = fetcher

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
