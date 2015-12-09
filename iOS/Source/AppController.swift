import UIKit

@UIApplicationMain
class AppController: UIResponder {

    var window: UIWindow?

    private lazy var fetcher: Fetcher = {
        let fetcher = Fetcher(baseURL: "https://sample.com", modelName: "Project")

        return fetcher
    }()
}

extension AppController: UIApplicationDelegate {
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        guard let window = self.window else { fatalError("Window not found") }

        let venuesNavigationController = UINavigationController(rootViewController: VenuesController(fetcher: self.fetcher))
        let venuesTabBarItem = UITabBarItem(title: "Venues", image: nil, selectedImage: nil)
        venuesNavigationController.tabBarItem = venuesTabBarItem

        let mapNavigationController = UINavigationController(rootViewController: MapController(fetcher: self.fetcher))
        let mapTabBarItem = UITabBarItem(title: "Map", image: nil, selectedImage: nil)
        mapNavigationController.tabBarItem = mapTabBarItem

        let tabController = TabBarController()
        tabController.viewControllers = [mapNavigationController, venuesNavigationController]

        window.rootViewController = tabController
        window.makeKeyAndVisible()

        return true
    }
}