//
//  RoomCell.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/24/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import UIKit
import Firebase

class RoomCell: UITableViewCell {

    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var roomFullnessView: RoundView!
    
    var room: Room!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(room: Room) {
        self.room = room
        self.roomLabel.text = "\(room.name) - Floor \(room.floor)"
        
        if room.status == 1 {
            self.roomFullnessView.backgroundColor = UIColor(red:0.98, green:0.55, blue:0.00, alpha:1.0)
        }
        else if room.status == 2 {
            self.roomFullnessView.backgroundColor = UIColor(red:0.79, green:0.17, blue:0.17, alpha:1.0)
        }
        else {
            self.roomFullnessView.backgroundColor = UIColor(red:0.00, green:0.90, blue:0.46, alpha:1.0)
        }
    }
}

