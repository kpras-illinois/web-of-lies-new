class_name InteractableM
extends Interactable

# Connect clicked for mouse-only callbacks; override _interact(actor) for E and mouse.
signal clicked

@export var test_output: String = "Hello"


func _interact(_actor: Node) -> void:
	print(test_output)


func _input_event(
	viewport: Viewport,
	event: InputEvent,
	_shape_idx: int
) -> void:
	if event is InputEventMouseButton \
			and event.button_index == MOUSE_BUTTON_LEFT \
			and event.pressed:
		if not interaction_enabled:
			return
		viewport.set_input_as_handled()
		interact()
		if is_instance_valid(self):
			clicked.emit()
