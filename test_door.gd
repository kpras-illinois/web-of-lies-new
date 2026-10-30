extends Area2D

var entered = false

func _on_body_entered(_body: PhysicsBody2D):
	if entered:
		return
	entered = true
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_file("res://police_station_corridor.tscn")

func _on_body_exited(_body):
	entered = false
