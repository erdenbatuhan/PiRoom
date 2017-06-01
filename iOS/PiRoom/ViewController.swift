//
//  ViewController.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/20/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
    
    var ref: FIRDatabaseReference!
    var refHandle: UInt!
    var buildingDataSource = BuildingDataSource()
    var buildingArray : [Building] = []
    
    var selectedIndexPath : Int?
    
    var engineeringCapacity = 0
    var engineeringOccupancy = 0
    var administrationCapacity = 0
    var administrationOccupancy = 0
    var lawCapaciy = 0
    var lawOccupancy = 0
    var scolaCapacity = 0
    var scolaOccupancy = 0
    var innovationCapacity = 0
    var innovationOccupancy = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
        
    }
    
    func removeAll() {
        
        engineeringCapacity = 0
        engineeringOccupancy = 0
        administrationCapacity = 0
        administrationOccupancy = 0
        lawCapaciy = 0
        lawOccupancy = 0
        scolaCapacity = 0
        scolaOccupancy = 0
        innovationCapacity = 0
        innovationOccupancy = 0
    }
    
    func loadData() {
        
        ref = FIRDatabase.database().reference()
        ref.child("rooms").observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let roomDict = snap.value as? Dictionary<String,AnyObject> {
                        let key = snap.key
                        let room = Room(roomKey: key, roomData: roomDict)
                        if room.building == 1 {
                            self.engineeringCapacity += 1
                            if room.status == 1 || room.status == 2 {
                                self.engineeringOccupancy += 1
                            }
                        }
                        else if room.building == 2{
                            self.administrationCapacity += 1
                            if room.status == 1 || room.status == 2 {
                                self.administrationOccupancy += 1
                            }
                        }
                        else if room.building == 3{
                            self.lawCapaciy += 1
                            if room.status == 1 || room.status == 2 {
                                self.lawOccupancy += 1
                            }
                        }
                        else if room.building == 4{
                            self.scolaCapacity += 1
                            if room.status == 1 || room.status == 2 {
                                self.scolaOccupancy += 1
                            }
                        }
                        else if room.building == 5{
                            self.innovationCapacity += 1
                            if room.status == 1 || room.status == 2 {
                                self.innovationOccupancy += 1
                            }
                        }
                    }
                }
            }
            self.buildingDataSource.buildingArray[0].buildingCapacity = self.engineeringCapacity
            self.buildingDataSource.buildingArray[0].buildingFullRoomNumber = self.engineeringOccupancy
            self.buildingDataSource.buildingArray[1].buildingCapacity = self.administrationCapacity
            self.buildingDataSource.buildingArray[1].buildingFullRoomNumber = self.administrationOccupancy
            self.buildingDataSource.buildingArray[2].buildingCapacity = self.lawCapaciy
            self.buildingDataSource.buildingArray[2].buildingFullRoomNumber = self.lawOccupancy
            self.buildingDataSource.buildingArray[3].buildingCapacity = self.scolaCapacity
            self.buildingDataSource.buildingArray[3].buildingFullRoomNumber = self.scolaOccupancy
            self.buildingDataSource.buildingArray[4].buildingCapacity = self.innovationCapacity
            self.buildingDataSource.buildingArray[4].buildingFullRoomNumber = self.innovationOccupancy
            self.tableView.reloadData()
            self.removeAll()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildingDataSource.buildingArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let building = buildingDataSource.buildingArray[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell") as? BuildingCell{
            cell.configureCell(building: building)
            return cell
        } else {
            return BuildingCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! RoomViewController
        
        controller.selectedBuilding = buildingDataSource.buildingArray[selectedIndexPath!]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath.row
        performSegue(withIdentifier: "goToRooms", sender: nil)
    }

}

