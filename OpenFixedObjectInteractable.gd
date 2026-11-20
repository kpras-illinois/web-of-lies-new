class_name OpenFixedObjectInteractable
extends InteractableM

@export var fixed_object: CameraFixedObject


func _interact(_actor: Node) -> void:
	if not is_instance_valid(fixed_object):
		push_warning("OpenFixedObjectInteractable: fixed_object is missing or freed.")
		return
	fixed_object.open()
