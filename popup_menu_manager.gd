extends MarginContainer

@export var menu_screen: VBoxContainer
@export var open_menu_screen: VBoxContainer
@export var fast_travel_screen: MarginContainer
@export var evidence_screen: HBoxContainer
# probably temporary code down here? Idk this feels like poor programming lmao
@export var evidence_page_0: NinePatchRect
@export var evidence_page_1: NinePatchRect

var evidencePage: int = 0
var maxEvidencePage: int = 1

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

# on pressing toggle button, reveals fast travel menu and hides regular menu
func _on_travel_to_toggle_button_pressed() -> void:
	toggle_visibility(fast_travel_screen)
	toggle_visibility(menu_screen)

# on pressing takes player to WEB's office
func _on_travel_to_web_office_pressed() -> void:
	# plays fading animation before moving
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_file("res://web_office.tscn")

# on pressing takes player to police station corridor
func _on_travel_to_police_station_corridor_pressed() -> void:
	# plays fading animation before moving
	SceneTransition.transition()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_file("res://police_station_corridor.tscn")

# when pressed, decreases page by 1, then moves to the correct page
func _on_evidence_menu_left_button_pressed() -> void:
	evidencePage -= 1
	# wraps around to last page if under
	if evidencePage < 0:
		evidencePage = maxEvidencePage
	# this is where my good page transition will go
	# IF I HAD ONE
	if evidencePage == 0:
		evidence_page_0.visible = true
		evidence_page_1.visible = false
	elif evidencePage == 1:
		evidence_page_0.visible = false
		evidence_page_1.visible = true

# when pressed, increases page by 1, then moves to the correct page
func _on_evidence_menu_right_button_pressed() -> void:
	evidencePage += 1
	# wraps around to first page if over
	if evidencePage > maxEvidencePage:
		evidencePage = 0
	# this is where my good page transition will go
	# IF I HAD ONE
	if evidencePage == 0:
		evidence_page_0.visible = true
		evidence_page_1.visible = false
	elif evidencePage == 1:
		evidence_page_0.visible = false
		evidence_page_1.visible = true
