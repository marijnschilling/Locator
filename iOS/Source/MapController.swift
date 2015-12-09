import UIKit
import MapKit
import CoreData

class MapController: BaseViewController {
    override func loadView() {
        let view = MKMapView(frame: UIScreen.mainScreen().bounds)
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Map"

        let fetchRequest = NSFetchRequest(entityName: Venue.entityName())
        let venues = try! self.fetcher.context.executeFetchRequest(fetchRequest) as! [Venue]
        let mapView = self.view as! MKMapView
        for venue in venues {
            let annotation = VenueAnnotation(venue: venue)
            mapView.addAnnotation(annotation)
        }
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
        guard let pinView = view as? VenueAnnotationView, venueAnnotation = pinView.annotation as? VenueAnnotation else { return }

        let controller = VenueController(venue: venueAnnotation.venue)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}