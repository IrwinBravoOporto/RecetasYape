//
//  FoodDetailVCPresenter.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit


protocol FoodDetailVCPresenterProtocol {
    func goToMapView(with mapView: Recipe)
}

class FoodDetailVCPresenter {
    private weak var currentController: FoodDetailViewController?
    var router : FoodDetailVCRouterProtocol!
    
    init(withRouter router: FoodDetailVCRouterProtocol, currentController: FoodDetailViewController ) {
        self.router = router
        self.currentController = currentController
    }
}

extension FoodDetailVCPresenter: FoodDetailVCPresenterProtocol {
   
    func goToMapView(with mapView: Recipe) {
        router.routeMapKit(with: mapView)
    }
}
