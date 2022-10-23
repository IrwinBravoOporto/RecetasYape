//
//  HomeVCConfigurator.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

protocol HomeVCConfiguratorProtocol {
    func configure(viewController: HomeViewController)

}

class HomeVCConfigurator : HomeVCConfiguratorProtocol{
    func configure(viewController: HomeViewController) {
        let router = HomeVCRouter(withView: viewController)
        viewController.presenter = HomeVCPresenter(withRouter: router, currentController: viewController)
    }
}
