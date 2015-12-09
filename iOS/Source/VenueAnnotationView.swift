import MapKit

protocol VenueAnnotationViewDelegate: class {
    func annotationViewDidSelect(annotationView: VenueAnnotationView)
}

class VenueAnnotationView: MKAnnotationView {
    weak var viewDelegate: VenueAnnotationViewDelegate?
    static let Identifier = "PinView"
    weak var venue: Venue?

    init(annotation: VenueAnnotation?) {
        super.init(annotation: annotation, reuseIdentifier: VenueAnnotationView.Identifier)

        self.canShowCallout = true
        self.image = UIImage(named: "dot")

        let image = UIImage(named: "detail-indicator")!
        let accessoryView = UIButton(type: .Custom)
        accessoryView.contentMode = .Center
        accessoryView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        accessoryView.setImage(image, forState: .Normal)
        self.rightCalloutAccessoryView = accessoryView

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapped")
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tapped() {
        self.viewDelegate?.annotationViewDidSelect(self)
    }
}

