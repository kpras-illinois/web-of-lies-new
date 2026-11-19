extends Node2D

var entered = false

func _ready():
	$Player.position = $SpawnPoint.position
	BackgroundMusicManager.stop_music()
