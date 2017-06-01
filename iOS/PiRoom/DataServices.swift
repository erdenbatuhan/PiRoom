//
//  DataService.swift
//  socialMedia
//
//  Created by OMER BUKTE on 1/8/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

let KEY_UID = "uid"

class DataService{
    
    static let ds = DataService()
    
    // DB References
    private var _REF_BASE = DB_BASE
    private var _REF_ROOMS = DB_BASE.child("rooms")
    private var _REF_BUILD = DB_BASE.child("buildings")
    
    
    var REF_ROOMS: FIRDatabaseReference {
        return _REF_ROOMS
    }
    
    var REF_BUILD: FIRDatabaseReference {
        return _REF_BUILD
    }
    
}
