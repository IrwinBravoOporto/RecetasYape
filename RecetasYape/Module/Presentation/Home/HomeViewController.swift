//
//  HomeViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionViewBorder: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgTopView: UIView!
    //
//    var loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sapien sem, commodo ac metus sed, dignissim cursus neque. Phasellus rutrum eros efficitur sapien lobortis lobortis. Suspendisse dapibus rhoncus arcu vel pellentesque. Aliquam justo ipsum, dignissim vel fermentum venenatis, sagittis id odio. Vivamus euismod tellus eu risus dictum mollis. Ut eget mi imperdiet, ultrices erat ut, tristique lacus. Integer volutpat urna vitae molestie egestas. Cras dui lorem, sagittis vel sagittis non, tristique nec nisi. Aenean vitae dui vel felis tincidunt mattis. Curabitur tristique est dolor, accumsan elementum turpis rutrum id. Curabitur pulvinar nisl vitae leo tempus, eget efficitur libero iaculis.orem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sapien sem, commodo ac metus sed, dignissim cursus neque. Phasellus rutrum eros efficitur sapien lobortis lobortis. Suspendisse dapibus rhoncus arcu vel pellentesque. Aliquam justo ipsum, dignissim vel fermentum venenatis, sagittis id odio. Vivamus euismod tellus eu risus dictum mollis. Ut eget mi imperdiet, ultrices erat ut, tristique lacus. Integer volutpat urna vitae molestie egestas."


    var recipeList = [
        Recipe(name: "Lasagna", category: "Plato", ingredients: ["Pulpa de cerdo 400g", "Salsa de Tomates", "Crema 500ml"], description: "Lorem ipsum dolor sit amet", imagen: "lasagna", country: "Italia", city: "Napoles", flag: "it"),
        Recipe(name: "Pizza", category: "Aperitivo", ingredients: ["Masa", "Queso Mozarella", "Salsa de tomates", "Peperoni"], description: "Lorem ipsum dolor sit amet", imagen: "pizza", country: "Italia", city: "Napoles", flag: "it"),
        Recipe(name: "Tiramisú", category: "Postre", ingredients: [], description: "Lorem ipsum dolor sit amet", imagen: "tiramisu", country: "Italia", city: "Venecia", flag: "it"),
        Recipe(name: "Sashimi", category: "Aperitivo", ingredients: ["Salmón crudo", "Sésamo", "Salsa de Soya"], description: "Lorem ipsum dolor sit amet", imagen: "sashimi", country: "Japon", city: "Saitama", flag: "jp"),
        Recipe(name: "Pure de papas", category: "Plato", ingredients: ["Papas 300g", "Leche 250ml"], description: "Lorem ipsum dolor sit amet", imagen: "puredepapas", country: "Francia", city: "Lyon", flag: "fr"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        let myLayer = CALayer()
        let myImage = UIImage(named: "Yape")?.cgImage
        myLayer.frame = CGRect(x: 0, y: 0, width: 430, height: 250)
        myLayer.contents = myImage
        imgTopView.layer.insertSublayer(myLayer, at: 0)
//        collectionView.delegate = self
     }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        self.collectionViewBorder.roundCorners([.topRight], radius: 40)
        
    }

    func setupNavigation(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
    }
}

extension HomeViewController : UICollectionViewDataSource {
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecetasCollectionViewCell", for: indexPath) as! RecetasCollectionViewCell
        
        cell.setup(with: recipeList[indexPath.row])
        
        return cell
    }
}
