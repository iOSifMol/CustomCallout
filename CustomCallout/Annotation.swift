//
//  Annotation.swift
//  CustomCallout
//
//  Created by Iosif Moldovan on 22.03.2022.
//

import Foundation
import CoreLocation
import MapKit

enum LondonAttraction: String, CaseIterable {
  case bigBen = "Big Ben"
  case buckinghamPalace = "Buckingham Palace"
  
  var coordinate: CLLocationCoordinate2D {
    switch self {
    case .bigBen:
      return CLLocationCoordinate2D(latitude: 51.50151264947639, longitude: -0.12458900921093766)
    case .buckinghamPalace:
      return CLLocationCoordinate2D(latitude: 51.50183212212502, longitude: -0.14165343486837872)
    }
  }
  
  var address: String {
    switch self {
    case .bigBen:
      return "London SW1A 0AA, United Kingdom"
    case .buckinghamPalace:
      return "London SW1A 1AA, United Kingdom"
    }
  }
  
  var image: UIImage? {
    switch self {
    case .bigBen:
      return UIImage(named: "bigBen")
    case .buckinghamPalace:
      return UIImage(named: "buckinghamPalace")
    }
  }
}

class Annotation: NSObject, MKAnnotation {
  let coordinate: CLLocationCoordinate2D
  let name: String
  let address: String
  let image: UIImage?
  
  init(attraction: LondonAttraction) {
    coordinate = attraction.coordinate
    name = attraction.rawValue
    address = attraction.address
    image = attraction.image
  }
}
