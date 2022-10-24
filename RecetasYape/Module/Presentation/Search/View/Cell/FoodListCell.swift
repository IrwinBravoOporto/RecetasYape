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
    @IBOutlet private weak var lblNameFoodDescription: UILabel!
    
    @IBOutlet weak var cardView: CardView!
    
      var cornerRadiusButton: CGFloat = 20

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.backgroundColor = .white
        cardView.cornerRadius = cornerRadiusButton
        cardView.shadowColor = .gray
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
        lblNameFoodDescription.text = data.description
    }
    
    func clearItemsUsers() {
        lblNameFood.text = nil
        lblNameFoodDescription.text = nil
    }
}


