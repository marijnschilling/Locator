import MapKit

class VenueAnnotationView: MKAnnotationView {
    static let Identifier = "PinView"

    override var annotation: MKAnnotation? {
        didSet {
            guard let _ = annotation as? VenueAnnotation else { return }
            self.image = UIImage(named: "dot")
        }
    }

    init(annotation: VenueAnnotation?) {
        super.init(annotation: annotation, reuseIdentifier: VenueAnnotationView.Identifier)

        let image = UIImage(named: "detail-indicator")!
        let accessoryView = UIButton(type: .DetailDisclosure)
        accessoryView.setImage(image, forState: .Normal)
        self.rightCalloutAccessoryView = accessoryView
        self.canShowCallout = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

