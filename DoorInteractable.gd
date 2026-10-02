class_name DoorInteractable
extends Interactable

@export var roomName: String = ""


func _interact(_actor: Node) -> void:
	get_tree().change_scene_to_file("res://" + roomName + ".tscn")
