//
//  FoodDetailVCConfigurator.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

protocol FoodDetailVCConfiguratorProtocol {
    func configure(viewController: FoodDetailViewController)

}

class FoodDetailVCConfigurator : FoodDetailVCConfiguratorProtocol{
    func configure(viewController: FoodDetailViewController) {
        let router = FoodDetailVCRouter(withView: viewController)
        viewController.presenter = FoodDetailVCPresenter(withRouter: router, currentController: viewController)
    }
}
