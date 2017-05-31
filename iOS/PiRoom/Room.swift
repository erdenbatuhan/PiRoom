//
//  Room.swift
//  PiRoom
//
//  Copyright © 2017 O.B.E. Software & Development. All rights reserved.
//

import Foundation

class Room {
    
    private var _building: Int!
    private var _floor: Int!
    private var _name: String!
    private var _status: Int!
    private var _roomKey: String!
    
    var building: Int {
        return _building
    }
    
    var floor: Int {
        return _floor
    }
    
    var name: String {
        return _name
    }
    
    
    var status: Int {
        return _status
    }
    
    var roomKey: String {
        return _roomKey
    }
    
    init(building: Int, floor: Int,name: String, status: Int) {
        self._building = building
        self._floor = floor
        self._name = name
        self._status = status
    }
    
    init(roomKey: String, roomData: Dictionary<String,AnyObject>) {
        self._roomKey = roomKey
        
        if let building = roomData["building"] as? Int {
            self._building = building
        }
        
        if let floor = roomData["floor"] as? Int {
            self._floor = floor
        }
        
        if let name = roomData["name"] as? String {
            self._name = name
        }
        
        if let status = roomData["status"] as? Int {
            self._status = status
        }
        
    }
}
