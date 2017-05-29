<?php
class Building {

    private $id = null;
    private $abbreviation = null;
    private $name = null;
    private $capacity = null;
    private $occupancy = null;
    private $rooms = null;

    public function __construct($id, $abbreviation, $name, $capacity, $occupancy) {
        $this->id = $id;
        $this->abbreviation = $abbreviation;
        $this->name = $name;
        $this->capacity = $capacity;
        $this->occupancy = $occupancy;

        $this->rooms = array();
    }

    public function addRoom($name, $building, $floor, $status) {
        $room = new Room($name, $building, $floor, $status);

        if (!$this->doesRoomsArrayContain($room))
            $this->rooms[] = $room;
    }

    private function doesRoomsArrayContain($room) {
        for ($i = 0; $i < count($this->rooms()); $i++)
            if ($this->rooms()[$i]->getName() == $room->getName())
                return true;

        return false;
    }

    public function getId() {
        return $this->id;
    }

    public function getAbbreviation() {
        return $this->abbreviation;
    }

    public function getName() {
        return $this->name;
    }

    public function getCapacity() {
        return $this->capacity;
    }

    public function getOccupancy() {
        return $this->occupancy;
    }

    public function getRooms() {
        return $this->rooms;
    }
}
?>