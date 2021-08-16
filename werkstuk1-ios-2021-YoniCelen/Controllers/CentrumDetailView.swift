//
//  CentrumDetailView.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class CentrumDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneNrLabel: UILabel!
    
    @IBOutlet weak var photoView: UIImageView! { didSet { photoView.isUserInteractionEnabled = true } }

    @IBOutlet weak var mapView: MKMapView!
    
    var centrum : Centrum!
    var location : CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = centrum.naam
        streetLabel.text = centrum.address.straat
        numberLabel.text = centrum.address.nummer
        postalCodeLabel.text = String(centrum.address.postcode)
        cityLabel.text = centrum.address.gemeente
        phoneNrLabel.text = centrum.telNr
        photoView.image = centrum.foto
        
        var location = CLLocationCoordinate2D()
        location.latitude = centrum.coordinates.latitude
        location.longitude = centrum.coordinates.longitude
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = centrum.naam
        mapView.addAnnotation(annotation)
        mapView.setRegion(MKCoordinateRegion(center: location, latitudinalMeters: 20000, longitudinalMeters: 20000), animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print("triggered")
        if segue.identifier == "toLargeImageView" {
            let LargeImageViewController = segue.destination as! LargeImageViewController
            LargeImageViewController.image = centrum.foto
        }
    }
}
