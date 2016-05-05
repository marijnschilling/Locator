import UIKit
import MapKit
import CoreData

class MapController: BaseViewController {
    var locatedUser = false

    lazy var locationManager: CLLocationManager = {
        let object = CLLocationManager()
        object.delegate = self
        object.requestWhenInUseAuthorization()
        return object
    }()

    override func loadView() {
        let view = MKMapView(frame: UIScreen.mainScreen().bounds)
        view.delegate = self
        self.view = view
    }

    lazy var venues: [Venue] = {
        let fetchRequest = NSFetchRequest(entityName: Venue.entityName())
        let venues = try! self.fetcher.context.executeFetchRequest(fetchRequest) as! [Venue]
        return venues
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Map"

        self.fetcher.posts { error in
            let mapView = self.view as! MKMapView
            for venue in self.venues {
                let annotation = VenueAnnotation(venue: venue)
                mapView.addAnnotation(annotation)
            }
        }

        let locationButton = UIBarButtonItem(title: "Nearby", style: .Done, target: self, action: #selector(MapController.locationButtonAction))
        self.navigationItem.rightBarButtonItem = locationButton
    }

    func showVenueFromAnnotation(annotation: VenueAnnotation) {
        let venueController = VenueController(fetcher: self.fetcher, venue: annotation.venue)
        self.presentViewController(venueController, animated: true, completion: nil)
    }

    func locationButtonAction() {
        let mapView = self.view as! MKMapView

        if self.locatedUser {
            mapView.zoomInCoordinate(mapView.userLocation.coordinate)
        }

        locationManager.startUpdatingLocation()
    }
}

extension MapController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let venueAnnotation = view.annotation as? VenueAnnotation else { return }
        showVenueFromAnnotation(venueAnnotation)
    }

    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {

    }
}

extension MapController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let mapView = self.view as! MKMapView
        for location in locations {
            self.locatedUser = true
            mapView.zoomInCoordinate(location.coordinate)
        }
        manager.stopUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        let mapView = self.view as! MKMapView
        mapView.showsUserLocation = true
    }
}