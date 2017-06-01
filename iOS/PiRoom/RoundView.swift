//
//  RoundView.swift
//  PiRoom
//
//  Copyright © 2017 O.B.E. Software & Development. All rights reserved.
//

import UIKit

class RoundView: UIView {

    let SHADOW_GREY: CGFloat = 120.0 / 255.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.init(red: SHADOW_GREY , green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width/2
    }

}
