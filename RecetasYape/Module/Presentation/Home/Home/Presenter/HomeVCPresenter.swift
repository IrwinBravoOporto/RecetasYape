//
//  HomeVCPresenter.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit


protocol HomeVCPresenterProtocol {
    func viewDidLoad()
    func detailFood(with food: Recipe)
}

class HomeVCPresenter {
    private weak var currentController: HomeViewController?
    var router : HomeVCRouterProtocol!
    
    init(withRouter router: HomeVCRouterProtocol, currentController: HomeViewController ) {
        self.router = router
        self.currentController = currentController
    }
}

extension HomeVCPresenter: HomeVCPresenterProtocol {
    
    func viewDidLoad() {
        guard let viewSelf = currentController else { return }
        viewSelf.dataFoodList = Constants.dataFood.dataRecipe
    }
    
    func detailFood(with food: Recipe) {
        router.routeDetailFood(with: food)
    }
}
