extends Node2D

@export var police_corridor_music: AudioStream

func _ready():
	$Player.position = $ExteriorSpawnPoint.position
	SignalBus.entering_police_from_exterior.connect(_on_entering_from_outside)
	SignalBus.entering_police_from_office.connect(_on_entering_from_office)
	if police_corridor_music:
		BackgroundMusicManager.play_music(police_corridor_music)

func _on_entering_from_outside():
	$Player.position = $ExteriorSpawnPoint.position

func _on_entering_from_office():
	$Player.position = $OfficeSpawnPoint.position
