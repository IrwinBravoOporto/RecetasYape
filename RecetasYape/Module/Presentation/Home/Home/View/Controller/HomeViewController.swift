//
//  HomeViewController.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionViewBorder: UIView! {
        didSet {
            self.collectionViewBorder.roundCorners([.topRight], radius: 50
            )
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            collectionView.register(UINib(nibName: RecetasCollectionViewCell.viewId, bundle: .main), forCellWithReuseIdentifier: RecetasCollectionViewCell.viewId)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var imgTopView: UIView! {
        didSet {
            let myLayer = CALayer()
            let myImage = UIImage(named: "Yape")?.cgImage
            myLayer.frame = CGRect(x: 0, y: 0, width: 430, height: 330)
            myLayer.contents = myImage
            imgTopView.layer.insertSublayer(myLayer, at: 0)
        }
    }
    
    var dataFoodList =  [Recipe]()
    var presenter: HomeVCPresenterProtocol!
    let configurator = HomeVCConfigurator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
     }
    
    func setupView() {
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    func setupNavigation(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - CollectionViewDataSource
extension HomeViewController : UICollectionViewDataSource {
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFoodList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecetasCollectionViewCell.viewId, for: indexPath) as! RecetasCollectionViewCell
        cell.setup(with: dataFoodList[indexPath.row])
        return cell
    }
}

// MARK: - CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.detailFood(with: dataFoodList[indexPath.row])
        print(dataFoodList[indexPath.row])
    }
}
