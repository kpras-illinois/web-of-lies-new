extends Node2D

@export var morgue_music: AudioStream

func _ready():
	$Player.position = $SpawnPoint.position
	if morgue_music:
		BackgroundMusicManager.play_music(morgue_music)
