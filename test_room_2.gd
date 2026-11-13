extends Node2D

func _ready():
	$Player.position = $ExteriorSpawnPoint.position
	SignalBus.entering_police_from_exterior.connect(_on_entering_from_outside)
	SignalBus.entering_police_from_office.connect(_on_entering_from_office)

func _on_entering_from_outside():
	$Player.position = $ExteriorSpawnPoint.position

func _on_entering_from_office():
	$Player.position = $OfficeSpawnPoint.position
