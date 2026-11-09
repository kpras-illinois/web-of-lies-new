extends Area2D

var hit = false

func _on_body_entered(_body: PhysicsBody2D):
	if hit:
		return
	hit = true
	print("success")

func _on_body_exited(_body):
	hit = false
