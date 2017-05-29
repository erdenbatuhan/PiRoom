//
//  BuildingImageView.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/24/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import UIKit

class BuildingImageView: UIImageView {

    let SHADOW_GREY: CGFloat = 120.0 / 255.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.init(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }

}
