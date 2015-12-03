import UIKit
import MapKit
import CoreData

class MapController: BaseViewController {
    override func loadView() {
        let view = MKMapView(frame: UIScreen.mainScreen().bounds)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Map"

        let fetchRequest = NSFetchRequest(entityName: Venue.entityName())
        let items = try! self.fetcher.context.executeFetchRequest(fetchRequest) as! [Venue]
        let mapView = self.view as! MKMapView
        for item in items {
            let annotation = MKPointAnnotation()
            annotation.title = item.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: Double(item.latitude!)!, longitude: Double(item.longitude!)!)
            mapView.addAnnotation(annotation)
        }
    }
}