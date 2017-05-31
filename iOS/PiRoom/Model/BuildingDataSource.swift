//
//  BuildingDataSource.swift
//  PiRoom
//
//  Copyright © 2017 O.B.E. Software & Development. All rights reserved.
//

import Foundation

class BuildingDataSource: NSObject {
    
    var buildingArray: [Building] = []
    var building1: Building
    var building2: Building
    var building3: Building
    var building4: Building
    var building5: Building
    
    override init () {
        
        self.building1 = Building(imageName: "AB1", name: "Engineering Faculty", capacity: 0, fullRoomNumber: 0)
        self.building2 = Building(imageName: "AB2", name: "Faculty of Economics and Administrative Sciences", capacity: 0, fullRoomNumber: 0)
        self.building3 = Building(imageName: "AB3", name: "Law Faculty", capacity: 0, fullRoomNumber: 0)
        self.building4 = Building(imageName: "AB4", name: "School of Languages", capacity: 0, fullRoomNumber: 0)
        self.building5 = Building(imageName: "AB5", name: "Innovation Center", capacity: 0, fullRoomNumber: 0)
        
        buildingArray.append(building1)
        buildingArray.append(building2)
        buildingArray.append(building3)
        buildingArray.append(building4)
        buildingArray.append(building5)
        
    }
}
