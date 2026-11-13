extends Area2D

var entered = false

func _on_body_entered(_body: Node2D) -> void:
	if entered:
		return
	entered = true
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_file("res://Rooms/morgue_office.tscn")

func _on_body_exited(_body: Node2D) -> void:
	entered = true
