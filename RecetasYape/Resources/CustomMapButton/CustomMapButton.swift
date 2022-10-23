//
//  CustomMapButton.swift
//  RecetasYape
//
//  Created by Irwin Bravo Oporto on 23/10/22.
//

import UIKit

@IBDesignable
class CustomMapButton: UIButton {
    
    weak var insideview:UIView?
    
    
    @IBInspectable var color: UIColor = .black
    @IBInspectable var cornerRadius: CGFloat = 15
    @IBInspectable var text: String = ""
    @IBInspectable var img_text: UIImage?
    
    //Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img_title: UIImageView!
    @IBOutlet weak var cardView: CardView!
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    //MARK: Initialize
    private func initialize(){
        insideview = loadViewFromNib()
        setupUI(view: insideview ?? UIView())
    }
    
    
    //MARK: UI Methods
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)),
                        bundle: bundle)
        return nib.instantiate( withOwner: self,
                                options: nil).first as? UIView
    }
    
    private func setupUI(view: UIView?){
        insideview?.frame = self.bounds
        addSubview(insideview ?? UIView())
        clearConstraints()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTheme()
    }
    
    private func clearConstraints(){
        insideview?.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                              options: [],
                              metrics: nil,
                              views: ["childView": insideview ?? UIView()]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                              options: [],
                              metrics: nil,
                              views: ["childView": insideview ?? UIView()]))
    }
    
    private func setupTheme(){
        layer.cornerRadius = cornerRadius
        cardView.cornerRadius = cornerRadius
        cardView.shadowColor = cardView.shadowColor
        cardView.backgroundColor = color
        title.textColor = .white
        title.text = text
        img_title.image = img_text
    }
}


