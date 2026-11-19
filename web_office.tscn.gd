extends Node2D

@export var web_office_music: AudioStream

func _ready():
	$Player.position = $SpawnPoint.position
	if web_office_music:
		BackgroundMusicManager.play_music(web_office_music)
