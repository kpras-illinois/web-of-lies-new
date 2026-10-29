extends Area2D

# variable to see if "door" has been interacted with
var entered = false;


# checks when the "door" is being contacted
# if so, moves from office to police corridor
func _on_body_entered(_body: PhysicsBody2D):
	entered = true # door is being contacted
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	entered = false
	get_tree().change_scene_to_file("res://police_station_corridor.tscn")
