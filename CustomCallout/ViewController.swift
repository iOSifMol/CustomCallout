//
//  ViewController.swift
//  CustomCallout
//
//  Created by Iosif Moldovan on 22.03.2022.
//

import UIKit
import MapKit

enum Mode {
  case subclassAnnotationView // proposal found on "internet"
  case implementAnnotationDelegate // easy way to implement custom callout and benefit of native implementation
}

class ViewController: UIViewController {
  @IBOutlet weak var mapView: MKMapView!
  let mode: Mode = .implementAnnotationDelegate //.subclassAnnotationView
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let annotations = LondonAttraction.allCases.map({ Annotation(attraction: $0) })
    mapView.center(to: annotations.first!.coordinate)
    mapView.addAnnotations(annotations)
    // an easy way to switch between displayed callout modes
    switch mode {
    case .subclassAnnotationView:
      mapView.register(AnnotationView.self,
                       forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    case .implementAnnotationDelegate:
      mapView.delegate = self
    }
  }
}

// MARK: - MKMapViewDelegate
extension ViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    if let annotation = annotation as? Annotation {
      annotationView?.canShowCallout = true
      annotationView?.detailCalloutAccessoryView = Callout(annotation: annotation)
    }
    return annotationView
  }
}

// MARK: - Center MaView location
private extension MKMapView {
  func center(to coordinate: CLLocationCoordinate2D, regionRadius: CLLocationDistance = 4000) {
    let coordinateRegion = MKCoordinateRegion(center: coordinate,
                                              latitudinalMeters: regionRadius,
                                              longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
