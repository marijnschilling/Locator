import MapKit

extension MKMapView {
    func zoomInCoordinate(coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        let zoomedRegion = self.regionThatFits(region)
        self.setRegion(zoomedRegion, animated: true)
    }
}