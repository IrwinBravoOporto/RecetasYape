//
//  CardView.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 22/10/22.
//

import UIKit

@IBDesignable
class CardView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 10
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 2
    @IBInspectable var shadowColor: UIColor? = #colorLiteral(red: 0.1568627451, green: 0.2, blue: 0.2588235294, alpha: 1)
    @IBInspectable var shadowOpacity: Float = 1
    @IBInspectable var shadowRadius: CGFloat = 5
    @IBInspectable var masksToBounds: Bool = false
    
    override func awakeFromNib() {
        super.layoutSubviews()
        autoresizesSubviews = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = masksToBounds
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = shadowColor?.cgColor
        layer.cornerRadius = cornerRadius
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
    }
    
}


