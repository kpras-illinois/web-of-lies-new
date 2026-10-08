extends MarginContainer

const DialogueEntry = preload("res://Scenes/dialogue.tscn")

@onready var _dialogue_entries_container: Control = $PanelContainer/ScrollContainer/dialogue_entries

func _ready() -> void:
	next()

func next() -> void:
	var entry = DialogueEntry.instantiate()
	_dialogue_entries_container.add_child(entry)
	entry.set_content("Boxy", "Hello! I am boxy, the talking box!")
