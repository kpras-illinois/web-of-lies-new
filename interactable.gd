class_name Interactable
extends Area2D

@export var interaction_enabled: bool = true
@export var interaction_name: String = "Interact"


func interact(actor: Node = null) -> void:
	if not interaction_enabled:
		return

	_interact(actor)


func _interact(_actor: Node) -> void:
	pass
