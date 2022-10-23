//
//  HomeVCPresenter.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit


protocol HomeVCPresenterProtocol {
    func viewDidLoad()
}

class HomeVCPresenter {
    private var view: HomeViewControllerProtocol?
    private weak var currentController: HomeViewController?
    var router : HomeVCRouterProtocol!
    
    init(withRouter router: HomeVCRouterProtocol, view: HomeViewControllerProtocol, currentController: HomeViewController ) {
        self.router = router
        self.view = view
        self.currentController = currentController
    }
}

extension HomeVCPresenter: HomeVCPresenterProtocol {
    
    func viewDidLoad() {
        guard let viewSelf = currentController else { return }
        viewSelf.dataFoodList = Constants.dataFood.dataRecipe
    }
}
