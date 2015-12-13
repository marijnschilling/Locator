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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Map"

        self.fetcher.stubPosts()

        self.fetcher.posts { error in
            let fetchRequest = NSFetchRequest(entityName: Venue.entityName())
            let venues = try! self.fetcher.context.executeFetchRequest(fetchRequest) as! [Venue]
            let mapView = self.view as! MKMapView
            for venue in venues {
                let annotation = VenueAnnotation(venue: venue)
                mapView.addAnnotation(annotation)
            }
        }

        let locationButton = UIBarButtonItem(image: UIImage(named: "location-normal")!, style: .Done, target: self, action: "locationButtonAction")
        self.navigationItem.rightBarButtonItem = locationButton
    }

    func showVenueFromAnnotation(annotation: VenueAnnotation) {
        let controller = VenueController(venue: annotation.venue)
        self.navigationController?.pushViewController(controller, animated: true)
    }

    func locationButtonAction() {
        let mapView = self.view as! MKMapView

        if self.locatedUser {
            mapView.zoomInCoordinate(mapView.userLocation.coordinate)
        }

        locationManager.startUpdatingLocation()

        let locationButton = UIBarButtonItem(image: UIImage(named: "location-selected")!, style: .Done, target: self, action: "locationButtonAction")
        self.navigationItem.rightBarButtonItem = locationButton
    }
}

extension MapController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation.isKindOfClass(MKPointAnnotation.self), let venueAnnotation = annotation as? VenueAnnotation else { return nil }

        if let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(VenueAnnotationView.Identifier) as? VenueAnnotationView {
            annotationView.annotation = venueAnnotation
            return annotationView
        } else {
            let annotationView = VenueAnnotationView(annotation: venueAnnotation)
            return annotationView
        }
    }

    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotationView = view as? VenueAnnotationView, venueAnnotation = annotationView.annotation as? VenueAnnotation else { return }
        showVenueFromAnnotation(venueAnnotation)
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