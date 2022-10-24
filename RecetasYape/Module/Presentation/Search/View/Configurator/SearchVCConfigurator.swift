//
//  SearchVCConfigurator.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

protocol SearchVCConfiguratorProtocol {
    func configure(viewController: SearchViewController)

}

class SearchVCConfigurator : SearchVCConfiguratorProtocol{
    func configure(viewController: SearchViewController) {
        let router = SearchVCRouter(withView: viewController)
        viewController.presenter = SearchVCPresenter(withRouter: router, currentController: viewController)
    }
}
