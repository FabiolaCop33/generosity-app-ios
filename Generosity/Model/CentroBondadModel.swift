//
//  CentroDeBondad.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 25/06/24.
//

import Foundation
import MapKit


struct CentroBondadModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let address: String
    let description: String
    let id_category: String
    let category: String
    
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


