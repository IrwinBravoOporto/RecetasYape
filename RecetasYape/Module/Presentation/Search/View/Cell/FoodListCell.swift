//
//  FoodListCell.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

class FoodListCell: UITableViewCell {
    
    // MARK: - Items User
    @IBOutlet private weak var lblNameFood: UILabel!
    @IBOutlet private weak var lblNameFoodCategory: UILabel!
    @IBOutlet weak var imgFood: UIImageView! {
        didSet {
            imgFood.layer.cornerRadius = 20
            imgFood.borderColor = .gray
            imgFood.borderWidth = 1
        }
    }
    @IBOutlet weak var viewStart: UIView! {
        didSet {
            viewStart.backgroundColor = UIColor(hexString: "#D8F4D7")
            viewStart.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var lblDetailCountry: UILabel!
    
    
    @IBOutlet weak var cardView: CardView! {
        didSet {
            cardView.backgroundColor = .white
            cardView.cornerRadius = 20
            cardView.shadowColor = .gray
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearItemsUsers()
    }
}

// MARK: - Cells configuration
extension FoodListCell {
    
    func setupData(data : Recipe) {
        lblNameFood.text = data.name
        lblNameFoodCategory.text = data.category
        lblDetailCountry.text = "\(data.country ?? String()), \(data.city ?? String())"
        imgFood.image = UIImage(named: data.imagen ?? String())
    }
    
    func clearItemsUsers() {
        lblNameFood.text = nil
        lblNameFoodCategory.text = nil
        lblDetailCountry.text = nil
        imgFood.image = nil
    }
}


