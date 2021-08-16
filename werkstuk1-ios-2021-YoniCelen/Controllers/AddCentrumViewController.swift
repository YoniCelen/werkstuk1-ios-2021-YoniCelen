//
//  AddCentrumViewController.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation
import UIKit
import CoreLocation

class AddCentrumViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var postalCodeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var phoneNrField: UITextField!
    
    @IBOutlet weak var save: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coordinates = Coordinates(latitude:0, longitude:0)
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var centrum : Centrum?
    
    var coordinates : Coordinates?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for:segue, sender: sender)
        
        if let button = sender as? UIBarButtonItem, button === save
        {
            let foto = UIImage(named: "default")
            let naam = nameField.text ?? ""
            let straat = streetField.text ?? ""
            let nummer = numberField.text ?? ""
            let postcode = Int(postalCodeField.text!) ?? 1000 //Brussel als standaard
            let gemeente = cityField.text ?? ""
            let telNr = phoneNrField.text ?? ""
            let address = straat + " " + nummer + " " + gemeente + " België"
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address) { (placemarks, error) in
                    self.processResponse(withPlacemarks: placemarks, error: error)
            }
            centrum = Centrum(naam: naam, address: Address(straat: straat, nummer: nummer, postcode: postcode, gemeente: gemeente), coordinates: self.coordinates!, telNr: telNr, foto: foto!)
            }
    }
    
    //Source: https://cocoacasts.com/forward-geocoding-with-clgeocoder (modified slightly)
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if let error = error {
            print("Unable to Forward Geocode Address (\(error))")

        } else {
            var location: CLLocation?
            if let placemarks = placemarks, placemarks.count > 0 {
                location = placemarks.first?.location
            }

            if let location = location {
                let myCoordinates = location.coordinate
                self.coordinates!.latitude = myCoordinates.latitude
                self.coordinates!.longitude = myCoordinates.longitude
                print(self.coordinates!.latitude)
                print(self.coordinates!.longitude)
            } else {
                print("No Matching Location Found")
            }
        }
    }
}
