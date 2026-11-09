extends Node
var evidencelog: Dictionary = {}


func _ready() -> void:
	register_items()


func register_items() -> void:
	var all_evidence = [
		preload("res://items/evidence_test_1.tres"),
		preload("res://items/evidence_test_2.tres"),
		preload("res://items/evidence_test_3.tres"),
		preload("res://items/evidence_test_4.tres"),
	]

	for evidence in all_evidence:
		evidencelog[evidence.id] = evidence


func get_evidence(item_id: String) -> EvidenceItem:
	return evidencelog.get(item_id)
