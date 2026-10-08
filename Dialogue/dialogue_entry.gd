extends MarginContainer

@onready var _text = $VBoxContainer/RichTextLabel

func _ready() -> void:
	set_content("Boxy","Hello! I am boxy the talking box!")


func set_content(speaker: String, text: String) -> void:
	# RGB Hexicdecimal change (000)
	_text.text = "[color=#0f0]%s[/color] - %s" %[speaker, text]
