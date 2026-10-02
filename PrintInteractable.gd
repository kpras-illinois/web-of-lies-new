class_name PrintInteractable
extends Interactable

@export var output_text: String = " "


func _interact(_actor: Node) -> void:
	print(output_text)
