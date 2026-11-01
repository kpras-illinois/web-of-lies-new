extends Button
const DialogueEntry = preload("res://Scenes/dialogue.tscn")
@onready var _dialogue_test = $"../../../../../../../../../../.."

var num = 1
func _on_pressed() -> void:	
	_dialogue_test.optionChoose(num)
