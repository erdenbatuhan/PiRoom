<?php
class Room {

    private $name = null;
    private $building = null;
    private $floor = null;
    private $status = null;

    public function __construct($name, $building, $floor, $status) {
        $this->$name = $name;
        $this->$building = $building;
        $this->$floor = $floor;
        $this->$status = $status;
    }

    public function getName() {
        return $this->name;
    }

    public function getBuilding() {
        return $this->building;
    }

    public function getFloor() {
        return $this->floor;
    }

    public function getStatus() {
        return $this->status;
    }
}
?>