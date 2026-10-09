extends Area2D

# variable to see if "door" has been interacted with
var entered = false;

# checks when the "door" is being contacted
func _on_body_entered(_body: PhysicsBody2D):
	entered = true # door is being contacted

# checks when the "door" is no longer being contacted
func _on_body_exited(_body):
	entered = false # door is not being contacted

#
func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("Interact"):
			get_tree().change_scene_to_file("res://test_room_2.tscn")
