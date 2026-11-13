extends MarginContainer

@export var menu_screen: VBoxContainer
@export var open_menu_screen: VBoxContainer
@export var fast_travel_screen: MarginContainer
@export var evidence_screen: HBoxContainer
# probably temporary code down here? Idk this feels like poor programming lmao
@export var evidence_page_0: NinePatchRect
@export var evidence_page_1: NinePatchRect
@export var page0texture: TextureRect
@export var page0text: Label

var default_texture = load("res://icon.svg")


var inventory = EvidenceDatabase.evidenceinventory
var evidencePage: int = 0
var maxEvidencePage: int = inventory.get_evidence_count()

# boolean to unlock morgue as teleportable location
# currently has no way to be true
var morgueUnlocked: bool = true

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
	get_tree().change_scene_to_file("res://Rooms/police_exterior.tscn")

# on pressing takes player to morgue
func _on_travel_to_morgue_pressed() -> void:
	# checks if you unlocked the morgue
	if morgueUnlocked:
		# plays fading animation before moving
		SceneTransition.transition()
		await SceneTransition.on_transition_finished
		get_tree().change_scene_to_file("res://Rooms/morgue_reception.tscn")
		
func _show_page(step: int) -> void:
	var items = inventory.get_all_evidence()
	if items.is_empty():
		page0texture.texture = default_texture
		page0text.text = "Your evidence is empty"
		evidence_page_0.visible = true
		return
	# wrapi wraps
	evidencePage = wrapi(evidencePage + step, 0, items.size())
 
	var item: EvidenceItem = items[evidencePage]
	page0texture.texture = item.icon
	page0text.text = item.description
	evidence_page_0.visible = true
 
func _on_evidence_menu_left_button_pressed() -> void:
	_show_page(-1)
 
func _on_evidence_menu_right_button_pressed() -> void:
	_show_page(1)
 
