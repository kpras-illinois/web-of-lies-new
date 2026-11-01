extends MarginContainer

@onready var _text = $VBoxContainer/RichTextLabel

#remove later


func set_content(speaker: String, text: String) -> void:
	# RGB Hexicdecimal change (000)
	_text.text = "[color=#0f0]%s[/color] - %s" %[speaker, text]
