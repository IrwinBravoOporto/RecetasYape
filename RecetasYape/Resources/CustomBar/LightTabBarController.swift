//
//  LightTabBarController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class LightTabBarController: TabBarViewController {

    override func makeTabBar() -> BaseCardTabBar {
        LightTabBar()
    }
}
