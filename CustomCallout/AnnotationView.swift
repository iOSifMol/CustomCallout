//
//  AnnotationView.swift
//  CustomCallout
//
//  Created by Iosif Moldovan on 23.03.2022.
//

import UIKit
import MapKit

class AnnotationView: MKPinAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      guard let value = newValue as? Annotation else { return }
      canShowCallout = true
      detailCalloutAccessoryView = Callout(annotation: value)
    }
  }
}
