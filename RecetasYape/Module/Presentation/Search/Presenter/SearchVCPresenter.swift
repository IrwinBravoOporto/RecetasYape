//
//  SearchVCPresenter.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import Foundation
import UIKit

 
protocol SearchVCPresenterProtocol {
    func goToFoodDetail(_ food: Recipe)
    func loadData()
    var dataFoodList: [Recipe]? { get }
}


class SearchVCPresenter {
    private  weak var currentController: SearchViewController?
    var router: SearchVCRouterProtocol!
    private(set) var dataFoodList: [Recipe]?
    
    init(withRouter router: SearchVCRouterProtocol, currentController: SearchViewController) {
        self.router = router
        self.currentController = currentController
    }
}

extension SearchVCPresenter: SearchVCPresenterProtocol {
    
    func loadData() {
        guard let viewSelf = currentController else { return }
        viewSelf.listFoodFilter = Constants.dataFood.dataRecipe
        dataFoodList = Constants.dataFood.dataRecipe
    }
    
    func goToFoodDetail(_ food: Recipe) {
        router.routeToPubDetail(food)
    }
}


