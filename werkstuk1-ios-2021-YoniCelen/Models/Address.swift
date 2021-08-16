//
//  Address.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation

class Address{
    var straat: String!
    var nummer: String!
    var postcode: Int!
    var gemeente: String!
    
    init(straat: String, nummer: String, postcode: Int, gemeente: String) {
        self.straat = straat
        self.nummer = nummer
        self.postcode = postcode
        self.gemeente = gemeente
    }
}
