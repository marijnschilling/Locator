import MapKit

class VenueAnnotationView: MKAnnotationView {
    static let Identifier = "PinView"
    weak var venue: Venue?

    init(annotation: VenueAnnotation?) {
        super.init(annotation: annotation, reuseIdentifier: VenueAnnotationView.Identifier)

        self.canShowCallout = true
        self.image = UIImage(named: "dot")

        let image = UIImage(named: "detail-indicator")!
        let accessoryView = UIButton(type: .DetailDisclosure)
        accessoryView.setImage(image, forState: .Normal)
        self.rightCalloutAccessoryView = accessoryView
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

