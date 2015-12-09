import MapKit

class VenueAnnotation: MKPointAnnotation {
    unowned var venue: Venue

    init(venue: Venue) {
        self.venue = venue

        super.init()

        self.title = venue.title
        self.coordinate = CLLocationCoordinate2D(latitude: Double(venue.latitude!)!, longitude: Double(venue.longitude!)!)
    }
}