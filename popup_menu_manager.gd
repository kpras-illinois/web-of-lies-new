extends MarginContainer

@export var menu_screen: VBoxContainer
@export var open_menu_screen: VBoxContainer
@export var fast_travel_screen: MarginContainer
@export var evidence_screen: MarginContainer
# @export var evidence_menu_screen: MarginContainer - figure out how to correctly define this

# decides whether to show the menu or not, by default menu is not seen
func toggle_visibility(object):
	if object.visible:
		# makes menu invisible
		object.visible = false
	else:
		# makes menu visible
		object.visible = true

# on pressing travel toggle button, reveals menu and hides original toggle
func _on_toggle_menu_button_pressed() -> void:
	toggle_visibility(menu_screen)
	toggle_visibility(open_menu_screen)

# on pressing evidence toggle button, reveals menu and hides original toggle
func _on_evidence_sheet_toggle_button_pressed() -> void:
	toggle_visibility(evidence_screen)
	toggle_visibility(menu_screen)
	#figure out what to do here

# on pressing toggle button, reveals fast travel menu and hides regular menu
func _on_travel_to_toggle_button_pressed() -> void:
	toggle_visibility(fast_travel_screen)
	toggle_visibility(menu_screen)

# on pressing takes player to test room 1
func _on_travel_to_test_room_1_pressed() -> void:
	# plays fading animation before moving
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_file("res://test_room_1.tscn")

# on pressing takes player to test room 2
func _on_travel_to_test_room_2_pressed() -> void:
	# plays fading animation before moving
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_file("res://test_room_2.tscn")
