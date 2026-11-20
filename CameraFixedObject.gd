class_name CameraFixedObject
extends CanvasLayer

signal opened
signal closed

@export var start_open: bool = false
@export var close_on_cancel: bool = true
@export var content: Control
@export var screen_margin: Vector2 = Vector2(16, 24)

var _is_open: bool = false
var _connected_content: Control


func _ready() -> void:
	follow_viewport_enabled = false
	get_viewport().size_changed.connect(_apply_fit)
	_is_open = start_open
	visible = _is_open
	call_deferred("_apply_fit")


func open() -> void:
	if _is_open:
		return
	_is_open = true
	visible = true
	_apply_fit()
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


func _apply_fit() -> void:
	if _connected_content != content:
		if is_instance_valid(_connected_content):
			_connected_content.resized.disconnect(_apply_fit)
		_connected_content = null
		if is_instance_valid(content):
			content.resized.connect(_apply_fit)
			_connected_content = content
	if not is_instance_valid(content):
		return
	var content_size: Vector2 = content.size
	if content_size.x <= 0.0 or content_size.y <= 0.0:
		return
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size
	var available := Vector2(
		maxf(viewport_size.x - maxf(screen_margin.x, 0.0) * 2.0, 1.0),
		maxf(viewport_size.y - maxf(screen_margin.y, 0.0) * 2.0, 1.0)
	)
	var factor: float = minf(1.0, minf(available.x / content_size.x, available.y / content_size.y))
	if factor <= 0.0 or is_nan(factor) or is_inf(factor):
		return
	content.pivot_offset = content_size * 0.5
	content.scale = Vector2.ONE * factor


func _unhandled_input(event: InputEvent) -> void:
	if not _is_open:
		return
	if not close_on_cancel:
		return
	if event.is_action_pressed("ui_cancel"):
		close()
		get_viewport().set_input_as_handled()
