//
//  CustomAnnotation.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let image: UIImage
 
    init(name: String, city: String, coordinate: CLLocationCoordinate2D, image: UIImage) {
        self.title = name
        self.subtitle = city
        self.coordinate = coordinate
        self.image = image
    }
}
