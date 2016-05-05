import MapKit

class VenueAnnotation: MKPointAnnotation {
    unowned var venue: Venue

    init(venue: Venue) {
        self.venue = venue

        super.init()

        self.title = venue.name
        self.coordinate = CLLocationCoordinate2D(latitude: venue.latitude?.doubleValue ?? 0, longitude: venue.longitude?.doubleValue ?? 0)
    }
}