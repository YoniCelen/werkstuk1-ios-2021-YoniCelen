//
//  Centrum.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation
import UIKit

class Centrum{
    
    var naam: String!
    var address: Address!
    var coordinates: Coordinates!
    var telNr: String!
    var foto: UIImage!
    
    init(naam: String, address: Address, coordinates: Coordinates, telNr: String, foto: UIImage) {
        self.naam = naam
        self.address = address
        self.coordinates = coordinates
        self.telNr = telNr
        self.foto = foto
    }
    init(naam: String, address: Address, telNr: String, foto: UIImage) {
        self.naam = naam
        self.address = address
        self.telNr = telNr
        self.foto = foto
    }
    init() {
    }
    
}
