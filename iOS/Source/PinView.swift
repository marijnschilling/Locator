import MapKit

class PinView: MKAnnotationView {
    static let Identifier = "PinView"
    weak var venue: Venue?

    init(annotation: PinAnnotation?) {
        super.init(annotation: annotation, reuseIdentifier: PinView.Identifier)

        self.canShowCallout = true
        self.image = UIImage(named: "dot")
        self.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}