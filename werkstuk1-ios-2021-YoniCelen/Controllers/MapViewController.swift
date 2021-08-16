//
//  MapViewController.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let LocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startUpdatingLocation()
        for vc in centra{
            let annotation = CustomAnnotation(name: vc.naam, city: vc.address.gemeente, coordinate: CLLocationCoordinate2D(latitude: vc.coordinates.latitude, longitude: vc.coordinates.longitude), image: vc.foto)
            mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.setRegion(MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000), animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
    ->MKAnnotationView?
    {
        guard let _annotation = annotation as? CustomAnnotation else {return nil}
        let _identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: _identifier) as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
        }
        else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: _identifier)
            view.canShowCallout = true
            let image = _annotation.image
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50);
            button.setImage(image, for: UIControl.State())
            let info = UILabel()
            info.text = _annotation.subtitle
            view.rightCalloutAccessoryView = info
            view.leftCalloutAccessoryView = button
        }
        return view
    }

}
