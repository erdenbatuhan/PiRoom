//
//  BuildingCell.swift
//  PiRoom
//
//  Copyright © 2017 O.B.E. Software & Development. All rights reserved.
//

import UIKit

class BuildingCell: UITableViewCell {

    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var buildingNameLabel: UILabel!
    @IBOutlet weak var buildingImage: UIImageView!
    
    var building: Building!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(building: Building) {
        self.building = building
        self.buildingNameLabel.text = "\(building.buildingName)"
        self.buildingImage.image = UIImage(named: building.buildingImageName)
        self.capacityLabel.text = "\(building.buildingFullRoomNumber)/\(building.buildingCapacity)"
        
        let capacity = Double(building.buildingFullRoomNumber) / Double(building.buildingCapacity)
        
        if building.buildingCapacity == 0 {
            self.capacityLabel.backgroundColor = UIColor(red: 0.72, green: 0.70, blue: 0.70, alpha: 1.0)
        } else if capacity == 1.0 {
            self.capacityLabel.backgroundColor = UIColor(red: 0.43, green: 0.10, blue: 0.10, alpha: 1.0)
            self.capacityLabel.text = "\(building.buildingFullRoomNumber)/\(building.buildingCapacity) \n FULL"
        } else if capacity >= 0.7 {
            self.capacityLabel.backgroundColor = UIColor(red: 0.79, green: 0.17, blue: 0.17, alpha: 1.0)
        } else if capacity >= 0.5 && capacity < 0.7 {
            self.capacityLabel.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1.0)
        } else {
            self.capacityLabel.backgroundColor = UIColor(red: 0.30, green: 0.69, blue: 0.31, alpha: 1.0)
        }
        
        self.capacityLabel.text = "\(building.buildingFullRoomNumber)/\(building.buildingCapacity)"
    }
}
