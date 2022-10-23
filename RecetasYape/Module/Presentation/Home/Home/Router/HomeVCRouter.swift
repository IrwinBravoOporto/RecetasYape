//
//  HomeVCRouter.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

protocol HomeVCRouterProtocol {
    func routeDetailFood(with food: Recipe)
}

class HomeVCRouter: HomeVCRouterProtocol {
    
    let storyboard = UIStoryboard(name: "Food", bundle: nil)
    weak var currentController: HomeViewController?

    init(withView view: HomeViewController) {
        self.currentController = view
    }
    
    func routeDetailFood(with food: Recipe) {
        guard let viewControllerDetail = storyboard.instantiateViewController(withIdentifier: "FoodDetailViewController") as? FoodDetailViewController else { return  }
        viewControllerDetail.foodDetail = food
        viewControllerDetail.modalPresentationStyle = .fullScreen
        currentController?.navigationController?.pushViewController(viewControllerDetail, animated: true)
    }
}
