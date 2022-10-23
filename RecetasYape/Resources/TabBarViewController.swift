//
//  TabBarViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var tabBarHeight: CGFloat {
        customTabBar.preferredTabBarHeight
    }
    
    lazy var customTabBar: BaseCardTabBar = makeTabBar()
    lazy var anotherSmallView = UIView()
    
    
    fileprivate var anotherSmallViewBottomConstraint: NSLayoutConstraint?
    fileprivate var tabBarHeightConstraint: NSLayoutConstraint?
        
    override var selectedIndex: Int {
        didSet {
            customTabBar.select(at: selectedIndex, animated: false, notifyDelegate: false)
        }
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            customTabBar.select(at: selectedIndex, animated: false, notifyDelegate: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true

        setupTabBar()
        updateTabBarHeightIfNeeded()
        NotificationCenter.default.addObserver(self, selector: #selector(tabBarHidden), name: Notification.Name("TabBarHidden"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showTabBar), name: Notification.Name("ShowTabBar"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customTabBar.set(items: tabBar.items ?? [])
        customTabBar.select(at: selectedIndex, animated: false, notifyDelegate: true)
    }
    
    
    fileprivate func setupTabBar(){
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: tabBarHeight, right: 0)
        
        customTabBar.delegate = self
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customTabBar)
        
        
        anotherSmallView.backgroundColor = customTabBar.preferredBottomBackground
        anotherSmallView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(anotherSmallView)
        
        anotherSmallView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        anotherSmallView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        anotherSmallView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        customTabBar.bottomAnchor.constraint(equalTo: anotherSmallView.topAnchor).isActive = true
        customTabBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        customTabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        self.view.bringSubviewToFront(customTabBar)
        self.view.bringSubviewToFront(anotherSmallView)
    }
    
    fileprivate func updateTabBarHeightIfNeeded(){
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: tabBarHeight, right: 0)

        
        tabBarHeightConstraint = customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight)
        tabBarHeightConstraint?.isActive = true

        anotherSmallViewBottomConstraint = anotherSmallView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: tabBarHeight)

        
        anotherSmallViewBottomConstraint?.priority = .defaultHigh
        anotherSmallViewBottomConstraint?.isActive = true
    }
    
    @objc func tabBarHidden(){
        setTabBarHidden(true, animated: true)
    }
    
    @objc func showTabBar(){
        setTabBarHidden(false, animated: true)
    }
    
     func setTabBarHidden(_ isHidden: Bool, animated: Bool){
        let block = {
            self.customTabBar.alpha = isHidden ? 0 : 1
            self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: isHidden ? 0 : self.tabBarHeight, right: 0)
        }
        
        if animated {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: block, completion: nil)
        } else {
            block()
        }
    }
    
    
    func makeTabBar() -> BaseCardTabBar {
        LightTabBar()
    }
}

extension TabBarViewController: CardTabBarDelegate {
    func cardTabBar(_ sender: BaseCardTabBar, didSelectItemAt index: Int) {
        self.selectedIndex = index
    }
    
    func didUpdateHeight() {
        self.updateTabBarHeightIfNeeded()
    }
}


