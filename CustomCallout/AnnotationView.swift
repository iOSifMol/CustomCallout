//
//  AnnotationView.swift
//  CustomCallout
//
//  Created by Iosif Moldovan on 23.03.2022.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      guard let value = newValue as? Annotation else { return }
//      image = UIImage.init(systemName: "plus")
      canShowCallout = true
      detailCalloutAccessoryView = Callout(annotation: value)
    }
  }
}
