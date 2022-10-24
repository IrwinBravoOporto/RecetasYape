//
//  FoodDetailVCRouter.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

protocol FoodDetailVCRouterProtocol {
    func routeMapKit(with mapView: Recipe)
}

class FoodDetailVCRouter: FoodDetailVCRouterProtocol {
    
    let storyboard = UIStoryboard(name: "MapKit", bundle: nil)
    weak var currentController: FoodDetailViewController?

    init(withView view: FoodDetailViewController) {
        self.currentController = view
    }
    
    func routeMapKit(with mapView: Recipe) {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "MapKitViewController") as? MapKitViewController else { return  }
        viewController.modalPresentationStyle = .fullScreen
        viewController.showMap = mapView
        currentController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
