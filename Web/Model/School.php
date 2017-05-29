<?php
class School {

    private $name = null;
    private $buildings = null;

    public function __construct($name) {
        $this->name = $name;
        $this->buildings = array();
    }

    public function addBuilding($id, $abbreviation, $name, $capacity, $occupancy) {
        $this->buildings[] = new Building($id, $abbreviation, $name, $capacity, $occupancy);
    }

    public function getName() {
        return $this->name;
    }

    public function getBuildings() {
        return $this->buildings;
    }
}
?>