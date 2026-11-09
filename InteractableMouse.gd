class_name InteractableM
extends Area2D

@export var test_output: String = "Hello"


func interact() -> void:
	print(test_output)


func _input_event(
	_viewport: Viewport,
	event: InputEvent,
	_shape_idx: int
) -> void:
	if event is InputEventMouseButton \
			and event.button_index == MOUSE_BUTTON_LEFT \
			and event.pressed:
		interact()
