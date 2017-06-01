//
//  RoomCellView.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/25/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import UIKit

class RoomCellView: UIView {

    let SHADOW_GREY: CGFloat = 120.0 / 255.0
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        layer.cornerRadius = 10.0
        
        layer.shadowColor = UIColor(red: SHADOW_GREY , green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 10.0
        
    }

}
