//
//  RecetasCollectionViewCell.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class RecetasCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgFood: UIImageView! {
        didSet {
            imgFood.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var lblTitleFood: UILabel!
    @IBOutlet weak var cardView: CardView!{
        didSet {
            cardView.cornerRadius = 20
            cardView.shadowColor = .gray
        }
    }
    

    override func prepareForReuse() {
        super.prepareForReuse()
        clearItemsUsers()
    }
    
    func setup(with food: Recipe) {
        imgFood.image = UIImage(named: food.imagen ?? String())
        lblTitleFood.text = food.name
    }
}

// MARK: - Cells configuration
extension RecetasCollectionViewCell {
    
    func clearItemsUsers() {
        imgFood.image = nil
        lblTitleFood.text = nil
        cardView.backgroundColor = .clear
    }
}
