//
//  BuildingDataSource.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/24/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import Foundation

class BuildingDataSource: NSObject {
    
    var buildingArray : [Building] = []
    var building1: Building
    var building2: Building
    var building3: Building
    var building4: Building
    var building5: Building
    
    override init ()
    {
        
        self.building1 = Building(imageName: "ab1", name: "Engineering Building", capacity: 0, fullRoomNumber: 0)
        self.building2 = Building(imageName: "ab2", name: "Administration Building", capacity: 0, fullRoomNumber: 0)
        self.building3 = Building(imageName: "ab3", name: "Law Building", capacity: 0, fullRoomNumber: 0)
        self.building4 = Building(imageName: "ab4", name: "Scola Building", capacity: 0, fullRoomNumber: 0)
        self.building5 = Building(imageName:"ab5",name: "Innovation Center", capacity: 0, fullRoomNumber: 0)
        
        buildingArray.append(building1)
        buildingArray.append(building2)
        buildingArray.append(building3)
        buildingArray.append(building4)
        buildingArray.append(building5)
        
    }
}