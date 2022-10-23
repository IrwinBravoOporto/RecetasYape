//
//  FoodDetailViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var imgTopView: UIImageView!{
        didSet {
            imgTopView.image = UIImage(named: foodDetail.imagen ?? "Yape")
        }
    }
    
    @IBOutlet weak var collectionViewBorder: UIView! {
        didSet {
            self.collectionViewBorder.roundCorners([.topRight], radius: 40)
        }
    }
    
    @IBOutlet weak var imgCountries: UIImageView! {
        didSet {
            guard let url = URL(string: FlagPortrait(flag: foodDetail.flag).resultUrl) else { return }
            
            let loader =  Loader()
            imgCountries.addSubview(loader)
            loader.setup(in: imgCountries)
            ImageCache.load(url: url) { image in
                DispatchQueue.main.async {
                    self.imgCountries.image = image
                    loader.removeFromSuperview()
                }
            }
        }
    }

    var foodDetail = Recipe()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}


extension FoodDetailViewController {
    
    func setupView() {
        view.backgroundColor = UIColor(hexString: "#272343")
        NotificationCenter.default.post(name: Notification.Name("TabBarHidden"), object: nil)
        setupNavigation()
    }
    
    func setupNavigation(){
        
        let back = UIBarButtonItem(image: UIImage(named: "img_back")?.withTintColor(.white), style: .plain, target: self, action: #selector(didTapBackButton))
        title = foodDetail.name
        self.navigationItem.setLeftBarButton(back, animated: false)
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexString: "#272343")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @objc func didTapBackButton(){
        self.navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: Notification.Name("ShowTabBar"), object: nil)
    }
}
