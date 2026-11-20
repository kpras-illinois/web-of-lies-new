class_name CameraFixedObject
extends CanvasLayer

signal opened
signal closed

@export var start_open: bool = false
@export var close_on_cancel: bool = true

var _is_open: bool = false


func _ready() -> void:
	follow_viewport_enabled = false
	_is_open = start_open
	visible = _is_open


func open() -> void:
	if _is_open:
		return
	_is_open = true
	visible = true
	opened.emit()


func close() -> void:
	if not _is_open:
		return
	_is_open = false
	visible = false
	closed.emit()


func toggle() -> void:
	if _is_open:
		close()
	else:
		open()


func is_open() -> bool:
	return _is_open


func _unhandled_input(event: InputEvent) -> void:
	if not _is_open:
		return
	if not close_on_cancel:
		return
	if event.is_action_pressed("ui_cancel"):
		close()
		get_viewport().set_input_as_handled()
