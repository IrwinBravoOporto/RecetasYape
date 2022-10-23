//
//  RecetasCollectionViewCell.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

class RecetasCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblTitleFood: UILabel!
    @IBOutlet weak var cardView: CardView!
    
    var cornerRadiusButton: CGFloat = 20

    
    override func awakeFromNib() {
        super.awakeFromNib()
            cardView.cornerRadius = cornerRadiusButton
            cardView.shadowColor = .gray
            imgFood.layer.cornerRadius = cornerRadiusButton

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearItemsUsers()
    }
    
    func setup(with food: Recipe) {
        imgFood.image = UIImage(named: food.imagen)
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
