//
//  HomeViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        view.backgroundColor = UIColor(hexString: "#272343")
    }

    func setupNavigation(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
