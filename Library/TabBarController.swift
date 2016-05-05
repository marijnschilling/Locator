import UIKit

class TabBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBar.tintColor = UIColor.blackColor()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let items = self.tabBar.items {
            for button in items {
                button.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -13)
                button.setTitleTextAttributes([NSFontAttributeName : UIFont.semiBold(16)], forState: .Normal)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}