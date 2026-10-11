extends MarginContainer

@export var menu_screen: VBoxContainer
@export var open_menu_screen: VBoxContainer
@export var fast_travel_screen: MarginContainer

func toggle_visibility(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true

func _on_toggle_menu_button_pressed() -> void:
	toggle_visibility(menu_screen)
	toggle_visibility(open_menu_screen)

func _on_travel_to_toggle_button_pressed() -> void:
	toggle_visibility(fast_travel_screen)
	toggle_visibility(menu_screen)

func _on_travel_to_test_room_1_pressed() -> void:
	get_tree().change_scene_to_file("res://test_room_1.tscn")

func _on_travel_to_test_room_2_pressed() -> void:
	get_tree().change_scene_to_file("res://test_room_2.tscn")
