//
//  MapKitViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit
import CoreLocation
import MapKit

class MapKitViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
        
    var showMap: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        render()
    }
}

extension MapKitViewController {
    
    func render() {
        let coordinate = CLLocationCoordinate2D(latitude: showMap?.latitude ?? Double(), longitude: showMap?.longitude ?? Double())
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}

extension MapKitViewController {
    
    func setupNavigation(){
        
        let back = UIBarButtonItem(image: UIImage(named: "img_back")?.withTintColor(.white), style: .plain, target: self, action: #selector(didTapBackButton))
        title = "\(showMap?.country ?? String()), \(showMap?.city ?? String())"
        self.navigationItem.setLeftBarButton(back, animated: false)
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexString: "#272343")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @objc func didTapBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Unit Test
extension MapKitViewController {
    
    func testUnitNumber(a: Int, b: Int) -> Int {
        return a + b
    }
}
