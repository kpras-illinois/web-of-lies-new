extends Button
const DialogueEntry = preload("res://Scenes/dialogue.tscn")
@onready var _dialogue_test = $"../../../../../../../../../../.."

func _on_pressed() -> void:
	"""print("Continue button pressed")"""
	_dialogue_test.advance_dialogue()
