import UIKit

class BaseCollectionViewController: UICollectionViewController {
    unowned var fetcher: Fetcher

    init(fetcher: Fetcher, collectionViewLayout: UICollectionViewLayout) {
        self.fetcher = fetcher

        super.init(collectionViewLayout: collectionViewLayout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
