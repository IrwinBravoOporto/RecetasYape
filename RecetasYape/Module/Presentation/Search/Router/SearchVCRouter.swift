//
//  SearchVCRouter.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

protocol SearchVCRouterProtocol {
    func routeToPubDetail(_ food: Recipe)
}

class SearchVCRouter: SearchVCRouterProtocol {
    weak var currentController: SearchViewController?
    
    init(withView view: SearchViewController) {
        self.currentController = view
    }
    
    func routeToPubDetail(_ food: Recipe) {
        let storyboard = UIStoryboard(name: "Food", bundle: nil)
        guard let viewControllerDetail = storyboard.instantiateViewController(withIdentifier: "FoodDetailViewController") as? FoodDetailViewController else { return  }
        viewControllerDetail.modalPresentationStyle = .fullScreen
        viewControllerDetail.foodDetail = food
        currentController?.navigationController?.pushViewController(viewControllerDetail, animated: true)
    }
}
