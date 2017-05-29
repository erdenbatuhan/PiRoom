//
//  Building.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/24/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import Foundation


class Building: NSObject {
    
    var buildingImageName : String
    var buildingName : String
    var buildingCapacity : Int
    var buildingFullRoomNumber : Int
    
    init (imageName :String, name : String, capacity : Int, fullRoomNumber : Int)
    {
        buildingImageName = imageName
        buildingName = name
        buildingCapacity = capacity
        buildingFullRoomNumber = fullRoomNumber
    }
}
