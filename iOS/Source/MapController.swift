import UIKit
import MapKit

class MapController: BaseViewController {
    override func loadView() {
        let view = MKMapView(frame: UIScreen.mainScreen().bounds)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Map"
    }
}