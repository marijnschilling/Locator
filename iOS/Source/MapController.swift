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
            let annotation = PinAnnotation(venue: venue)
            mapView.addAnnotation(annotation)
        }
    }
}

extension MapController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation.isKindOfClass(MKPointAnnotation.self), let pinAnnotation = annotation as? PinAnnotation else { return nil }

        if let pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(PinView.Identifier) as? PinView {
            pinView.annotation = pinAnnotation
            return pinView
        } else {
            let pinView = PinView(annotation: pinAnnotation)
            return pinView
        }
    }

    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let pinView = view as? PinView, pinAnnotation = pinView.annotation as? PinAnnotation else { return }

        let controller = VenueController(venue: pinAnnotation.venue)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}