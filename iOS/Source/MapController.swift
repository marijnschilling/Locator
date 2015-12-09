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

extension MapController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation.isKindOfClass(MKPointAnnotation.self) else { return nil }

        if let pointAnnotation = mapView.dequeueReusableAnnotationViewWithIdentifier("CustomPinAnnotationView") {
            pointAnnotation.annotation = annotation
            return pointAnnotation
        } else {
            let pointAnnotation = MKAnnotationView(annotation: annotation, reuseIdentifier: "CustomPinAnnotationView")
            pointAnnotation.canShowCallout = true
            pointAnnotation.image = UIImage(named: "dot")
            pointAnnotation.calloutOffset = CGPoint(x: 0, y: 32)
            return pointAnnotation
        }
    }

    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

    }
}