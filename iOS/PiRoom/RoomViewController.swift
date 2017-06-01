//
//  RoomViewController.swift
//  PiRoom
//
//  Created by OMER BUKTE on 4/24/17.
//  Copyright © 2017 Omer Bukte. All rights reserved.
//

import UIKit
import Firebase

class RoomViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buildingNameLabel: UILabel!

    var ref: FIRDatabaseReference!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var occupancyLabel: UILabel!
    var refHandle: UInt!
    
    var selectedBuilding : Building?

    var engineeringRooms = [Room]()
    var engineeringRoomsFloorOne = [Room]()
    var engineeringRoomsFloorTwo = [Room]()
    var engineeringRoomsFloorThree = [Room]()
    
    var administrationRooms = [Room]()
    var administrationRoomsFloorOne = [Room]()
    var administrationRoomsFloorTwo = [Room]()
    var administrationRoomsFloorThree = [Room]()
    
    var lawRooms = [Room]()
    var lawRoomsFloorOne = [Room]()
    var lawRoomsFloorTwo = [Room]()
    var lawRoomsFloorThree = [Room]()
    
    var scolaRooms = [Room]()
    var scolaRoomsFloorOne = [Room]()
    var scolaRoomsFloorTwo = [Room]()
    var scolaRoomsFloorThree = [Room]()
    
    var innovationRooms = [Room]()
    var innovationRoomsFloorOne = [Room]()
    var innovationRoomsFloorTwo = [Room]()
    var innovationRoomsFloorThree = [Room]()
    
    var engineeringCapacity = 0
    var engineeringOccupancy = 0
    var engineeringFloorOneCapacity = 0
    var engineeringFloorOneOccupancy = 0
    var engineeringFloorTwoCapacity = 0
    var engineeringFloorTwoOccupancy = 0
    var engineeringFloorThreeCapacity = 0
    var engineeringFloorThreeOccupancy = 0
    
    var administrationCapacity = 0
    var administrationOccupancy = 0
    var administrationFloorOneCapacity = 0
    var administrationFloorOneOccupancy = 0
    var administrationFloorTwoCapacity = 0
    var administrationFloorTwoOccupancy = 0
    var administrationFloorThreeCapacity = 0
    var administrationFloorThreeOccupancy = 0
    
    var lawCapacity = 0
    var lawOccupancy = 0
    var lawFloorOneCapacity = 0
    var lawFloorOneOccupancy = 0
    var lawFloorTwoCapacity = 0
    var lawFloorTwoOccupancy = 0
    var lawFloorThreeCapacity = 0
    var lawFloorThreeOccupancy = 0
    
    var scolaCapacity = 0
    var scolaOccupancy = 0
    var scolaFloorOneCapacity = 0
    var scolaFloorOneOccupancy = 0
    var scolaFloorTwoCapacity = 0
    var scolaFloorTwoOccupancy = 0
    var scolaFloorThreeCapacity = 0
    var scolaFloorThreeOccupancy = 0
    
    var innovationCapacity = 0
    var innovationOccupancy = 0
    var innovationFloorOneCapacity = 0
    var innovationFloorOneOccupancy = 0
    var innovationFloorTwoCapacity = 0
    var innovationFloorTwoOccupancy = 0
    var innovationFloorThreeCapacity = 0
    var innovationFloorThreeOccupancy = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        buildingNameLabel.text = selectedBuilding?.buildingName
        
        loadData()
        
    }
    
    func loadData() {
        
        ref = FIRDatabase.database().reference()
        ref.child("rooms").observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                self.removeAll()
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let roomDict = snap.value as? Dictionary<String,AnyObject> {
                        let key = snap.key
                        let room = Room(roomKey: key, roomData: roomDict)
                        //   ENGINEERING ROOMS WITH FLOORS
                        if room.building == 1 {
                            self.engineeringRooms.append(room)
                            if room.floor == -2 {
                                self.engineeringRoomsFloorOne.append(room)
                                self.engineeringFloorOneCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.engineeringFloorOneOccupancy += 1
                                    self.engineeringOccupancy += 1
                                }
                            }
                            else if room.floor == 0 {
                                self.engineeringRoomsFloorTwo.append(room)
                                self.engineeringFloorTwoCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.engineeringFloorTwoOccupancy += 1
                                    self.engineeringOccupancy += 1
                                }
                            }
                            else if room.floor == 1 {
                                self.engineeringRoomsFloorThree.append(room)
                                self.engineeringFloorThreeCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.engineeringFloorThreeOccupancy += 1
                                    self.engineeringOccupancy += 1
                                }
                            }
                            self.engineeringCapacity += 1
                        }
                        //   ADMINISTRATION ROOMS WITH FLOORS
                        else if room.building == 2{
                            self.administrationRooms.append(room)
                            if room.floor == 1 {
                                self.administrationRoomsFloorOne.append(room)
                                self.administrationFloorOneCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.administrationFloorOneOccupancy += 1
                                    self.administrationOccupancy += 1
                                }
                            }
                            else if room.floor == 2 {
                                self.administrationRoomsFloorTwo.append(room)
                                self.administrationFloorTwoCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.administrationFloorTwoOccupancy += 1
                                    self.administrationOccupancy += 1
                                }
                            }
                            else if room.floor == 3 {
                                self.administrationRoomsFloorThree.append(room)
                                self.administrationFloorThreeCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.administrationFloorThreeOccupancy += 1
                                    self.administrationOccupancy += 1
                                }
                            }
                            self.administrationCapacity += 1
                        }
                        //   LAW ROOMS WITH FLOORS
                        else if room.building == 3{
                            self.lawRooms.append(room)
                            if room.floor == 1 {
                                self.lawRoomsFloorOne.append(room)
                                self.lawFloorOneCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.lawFloorOneOccupancy += 1
                                    self.lawOccupancy += 1
                                }
                            }
                            else if room.floor == 2 {
                                self.lawRoomsFloorTwo.append(room)
                                self.lawFloorTwoCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.lawFloorTwoOccupancy += 1
                                    self.lawOccupancy += 1
                                }
                            }
                            else if room.floor == 3 {
                                self.lawRoomsFloorThree.append(room)
                                self.lawFloorThreeCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.lawFloorThreeOccupancy += 1
                                    self.lawOccupancy += 1
                                }
                            }
                            self.lawCapacity += 1
                        }
                        //   SCOLA ROOMS WITH FLOORS
                        else if room.building == 4{
                            self.scolaRooms.append(room)
                            if room.floor == 1 {
                                self.scolaRoomsFloorOne.append(room)
                                self.scolaFloorOneCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.scolaFloorOneOccupancy += 1
                                    self.scolaOccupancy += 1
                                }
                            }
                            else if room.floor == 2 {
                                self.scolaRoomsFloorTwo.append(room)
                                self.scolaFloorTwoCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.scolaFloorTwoOccupancy += 1
                                    self.scolaOccupancy += 1
                                }
                            }
                            else if room.floor == 3 {
                                self.scolaRoomsFloorThree.append(room)
                                self.scolaFloorThreeCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.scolaFloorThreeOccupancy += 1
                                    self.scolaOccupancy += 1
                                }
                            }
                            self.scolaCapacity += 1
                        }
                        //   INNOVATION ROOMS WITH FLOORS
                        else if room.building == 5{
                            self.innovationRooms.append(room)
                            if room.floor == 1 {
                                self.innovationRoomsFloorOne.append(room)
                                self.innovationFloorOneCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.innovationFloorOneOccupancy += 1
                                    self.innovationOccupancy += 1
                                }
                            }
                            else if room.floor == 2 {
                                self.innovationRoomsFloorTwo.append(room)
                                self.innovationFloorTwoCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.innovationFloorTwoOccupancy += 1
                                    self.innovationOccupancy += 1
                                }
                            }
                            else if room.floor == 3 {
                                self.innovationRoomsFloorThree.append(room)
                                self.innovationFloorThreeCapacity += 1
                                if room.status == 1 || room.status == 2 {
                                    self.innovationFloorThreeOccupancy += 1
                                    self.innovationOccupancy += 1
                                }
                            }
                            self.innovationCapacity += 1
                        }
                    }
                    
                }
            }
            
            self.tableView.reloadData()
            self.setOccupancyLabel()
        })
    }
    
    func setOccupancyLabel() {
        var occupancyRate = 0.0
        // SET CAPACITY LABEL OF OCCUPANCY LABEL
        if selectedBuilding?.buildingName  == "Engineering Building" {
            occupancyRate = Double(engineeringOccupancy) / Double(engineeringCapacity)
            occupancyLabel.text = ("\(engineeringOccupancy)/\(engineeringCapacity)")
        }
        else if selectedBuilding?.buildingName == "Administration Building"{
            occupancyRate = Double(administrationOccupancy) / Double(administrationCapacity)
            occupancyLabel.text = ("\(administrationOccupancy)/\(administrationCapacity)")
        }
        else if selectedBuilding?.buildingName  == "Law Building" {
            occupancyRate = Double(lawOccupancy) / Double(lawCapacity)
            occupancyLabel.text = ("\(lawOccupancy)/\(lawCapacity)")
        }
        else if selectedBuilding?.buildingName  == "Scola Building" {
            occupancyRate = Double(scolaOccupancy) / Double(scolaCapacity)
            occupancyLabel.text = ("\(scolaOccupancy)/\(scolaCapacity)")
        }
        else if selectedBuilding?.buildingName == "Innovation Center" {
            occupancyRate = Double(innovationOccupancy) / Double(innovationCapacity)
            occupancyLabel.text = ("\(innovationOccupancy)/\(innovationCapacity)")
        }
        // SET COLORS OF THE OCCUPANCY LABEL
        if occupancyRate == 1.0 {
            self.occupancyLabel.backgroundColor = UIColor(red:0.43, green:0.10, blue:0.10, alpha:1.0)
        }
        else if occupancyRate >= 0.7 {
            self.occupancyLabel.backgroundColor = UIColor(red:0.79, green:0.17, blue:0.17, alpha:1.0)
        }
        else if occupancyRate >= 0.5 && occupancyRate < 0.7{
            self.occupancyLabel.backgroundColor = UIColor(red:0.98, green:0.75, blue:0.18, alpha:1.0)
        }
        else {
            self.occupancyLabel.backgroundColor = UIColor(red:0.30, green:0.69, blue:0.31, alpha:1.0)
        }
    }
    
    func removeAll() {
        self.engineeringRooms.removeAll()
        self.engineeringRoomsFloorOne.removeAll()
        self.engineeringRoomsFloorTwo.removeAll()
        self.engineeringRoomsFloorThree.removeAll()
        
        self.administrationRooms.removeAll()
        self.administrationRoomsFloorOne.removeAll()
        self.administrationRoomsFloorTwo.removeAll()
        self.administrationRoomsFloorThree.removeAll()
        
        self.lawRooms.removeAll()
        self.lawRoomsFloorOne.removeAll()
        self.lawRoomsFloorTwo.removeAll()
        self.lawRoomsFloorThree.removeAll()
        
        self.scolaRooms.removeAll()
        self.scolaRoomsFloorOne.removeAll()
        self.scolaRoomsFloorTwo.removeAll()
        self.scolaRoomsFloorThree.removeAll()
        
        self.innovationRooms.removeAll()
        self.innovationRoomsFloorOne.removeAll()
        self.innovationRoomsFloorTwo.removeAll()
        self.innovationRoomsFloorThree.removeAll()
        
        
        self.engineeringCapacity = 0
        self.engineeringOccupancy = 0
        self.engineeringFloorOneCapacity = 0
        self.engineeringFloorOneOccupancy = 0
        self.engineeringFloorTwoCapacity = 0
        self.engineeringFloorTwoOccupancy = 0
        self.engineeringFloorThreeCapacity = 0
        self.engineeringFloorThreeOccupancy = 0
        
        self.administrationCapacity = 0
        self.administrationOccupancy = 0
        self.administrationFloorOneCapacity = 0
        self.administrationFloorOneOccupancy = 0
        self.administrationFloorTwoCapacity = 0
        self.administrationFloorTwoOccupancy = 0
        self.administrationFloorThreeCapacity = 0
        self.administrationFloorThreeOccupancy = 0
        
        self.lawCapacity = 0
        self.lawOccupancy = 0
        self.lawFloorOneCapacity = 0
        self.lawFloorOneOccupancy = 0
        self.lawFloorTwoCapacity = 0
        self.lawFloorTwoOccupancy = 0
        self.lawFloorThreeCapacity = 0
        self.lawFloorThreeOccupancy = 0
        
        self.scolaCapacity = 0
        self.scolaOccupancy = 0
        self.scolaFloorOneCapacity = 0
        self.scolaFloorOneOccupancy = 0
        self.scolaFloorTwoCapacity = 0
        self.scolaFloorTwoOccupancy = 0
        self.scolaFloorThreeCapacity = 0
        self.scolaFloorThreeOccupancy = 0
        
        self.innovationCapacity = 0
        self.innovationOccupancy = 0
        self.innovationFloorOneCapacity = 0
        self.innovationFloorOneOccupancy = 0
        self.innovationFloorTwoCapacity = 0
        self.innovationFloorTwoOccupancy = 0
        self.innovationFloorThreeCapacity = 0
        self.innovationFloorThreeOccupancy = 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if selectedBuilding?.buildingName  == "Engineering Building" {
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                return engineeringRooms.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                return engineeringRoomsFloorOne.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                return engineeringRoomsFloorTwo.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                return engineeringRoomsFloorThree.count
            }
        }
        else if selectedBuilding?.buildingName == "Administration Building"{
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                return administrationRooms.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                return administrationRoomsFloorOne.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                return administrationRoomsFloorTwo.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                return administrationRoomsFloorThree.count
            }
        }
        else if selectedBuilding?.buildingName  == "Law Building" {
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                return lawRooms.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                return lawRoomsFloorOne.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                return lawRoomsFloorTwo.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                return lawRoomsFloorThree.count
            }
        }
        else if selectedBuilding?.buildingName  == "Scola Building" {
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                return scolaRooms.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                return scolaRoomsFloorOne.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                return scolaRoomsFloorTwo.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                return scolaRoomsFloorThree.count
            }
        }
        else if selectedBuilding?.buildingName == "Innovation Center" {
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                return innovationRooms.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                return innovationRoomsFloorOne.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                return innovationRoomsFloorTwo.count
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                return innovationRoomsFloorThree.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selectedBuilding?.buildingName  == "Engineering Building" {
            var room = engineeringRooms[indexPath.row]
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                room = engineeringRooms[indexPath.row]
                }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                room = engineeringRoomsFloorOne[indexPath.row]
                }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                room = engineeringRoomsFloorTwo[indexPath.row]
                }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                room = engineeringRoomsFloorThree[indexPath.row]
                }
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as? RoomCell{
                cell.configureCell(room: room)
                return cell
            } else {
                return RoomCell()
            }
        }
        else if selectedBuilding?.buildingName == "Administration Building"{
            var room = administrationRooms[indexPath.row]
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                room = administrationRooms[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                room = administrationRoomsFloorOne[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                room = administrationRoomsFloorTwo[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                room = administrationRoomsFloorThree[indexPath.row]
            }
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as? RoomCell{
                cell.configureCell(room: room)
                return cell
            } else {
                return RoomCell()
            }
        }
        else if selectedBuilding?.buildingName  == "Law Building" {
            var room = lawRooms[indexPath.row]
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                room = lawRooms[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                room = lawRoomsFloorOne[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                room = lawRoomsFloorTwo[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                room = lawRoomsFloorThree[indexPath.row]
            }
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as? RoomCell{
                cell.configureCell(room: room)
                return cell
            } else {
                return RoomCell()
            }
        }
        else if selectedBuilding?.buildingName  == "Scola Building" {
            var room = scolaRooms[indexPath.row]
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                room = scolaRooms[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                room = scolaRoomsFloorOne[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                room = scolaRoomsFloorTwo[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                room = scolaRoomsFloorThree[indexPath.row]
            }
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as? RoomCell{
                cell.configureCell(room: room)
                return cell
            } else {
                return RoomCell()
            }
        }
        else if selectedBuilding?.buildingName == "Innovation Center" {
            var room = innovationRooms[indexPath.row]
            if segmentedControlOutlet.selectedSegmentIndex == 0 {
                room = innovationRooms[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 1 {
                room = innovationRoomsFloorOne[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 2 {
                room = innovationRoomsFloorTwo[indexPath.row]
            }
            else if segmentedControlOutlet.selectedSegmentIndex == 3 {
                room = innovationRoomsFloorThree[indexPath.row]
            }
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as? RoomCell{
                cell.configureCell(room: room)
                return cell
            } else {
                return RoomCell()
            }
        }
        else {
            return RoomCell()
        }
    }
    
    @IBAction func segmentChange(_ sender: Any) {
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

}
