class_name MouseClickControl
extends Control

# Connect clicked externally, or inherit and override _click().
signal clicked

@export var click_enabled: bool = true


func _gui_input(event: InputEvent) -> void:
	if not click_enabled:
		return
	if event is InputEventMouseButton \
			and event.button_index == MOUSE_BUTTON_LEFT \
			and event.pressed:
		accept_event()
		_click()
		if is_instance_valid(self):
			clicked.emit()


func _click() -> void:
	pass
