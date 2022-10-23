//
//  FoodDetailViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    var foodDetail = Recipe()
    
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
    
    @IBOutlet weak var lblCategory: UILabel! {
        didSet {
            lblCategory.text = foodDetail.category ?? String()
        }
    }
    @IBOutlet weak var lblOrigin: UILabel! {
        didSet {
            lblOrigin.text = "\(foodDetail.country ?? String()), \(foodDetail.city ?? String())"
        }
    }
    @IBOutlet weak var ingredientsTextView: UITextView! {
        didSet {
            
            guard let  array = foodDetail.ingredients else {return}
            
            var textValue = String()
            if(foodDetail.ingredients?.count ?? Int() > 0){
                for element in array {
                    textValue.append("\(element)")
                }
                ingredientsTextView.text = textValue
            } else{
                ingredientsTextView.text = "Ingredientes no definidos"
            }
            ingredientsTextView.textColor = .white
        }
    }
    
    @IBOutlet weak var preparationTextView: UITextView! {
        didSet {
            preparationTextView.text = foodDetail.description
            preparationTextView.textColor = .white
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
