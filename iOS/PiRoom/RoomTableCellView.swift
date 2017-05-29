//
//  RoomTableCellView.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/24/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import UIKit

class RoomTableCellView: UIView {

    let SHADOW_GREY: CGFloat = 120.0 / 255.0
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GREY , green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        layer.cornerRadius = 5.0
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5.0
        
    }

}
