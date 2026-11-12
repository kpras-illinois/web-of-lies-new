class_name EvidenceInventory
extends RefCounted
const SAVE_PATH = "user://EvidenceInventory.json"


var evidencelog: Dictionary = {}


#Dictionary of the evidence collected, id, evidence.tscn


func add_item(item: EvidenceItem) -> bool:#add an item to the dictionary
	if item == null:
		return false

	if evidencelog.has(item.id):
		return false
#Checks 

	evidencelog[item.id] = item#Evidencelog uses the item's id as a key for the actual item object
	return true
func remove_item(item_id: String) -> bool:
	if not evidencelog.has(item_id):
		return false
	evidencelog.erase(item_id)
	return true
func has_evidence(item_id: String) -> bool:
	return evidencelog.has(item_id)
func get_evidence(item_id: String) -> EvidenceItem:
	return evidencelog.get(item_id)
func get_all_evidence() -> Array[EvidenceItem]:
	var result: Array[EvidenceItem] = []
	for item in evidencelog.values():
		result.append(item)
	return result
	
#Me when I get an onion ring in my evidence:
#What is this, I did not order an onion ring
func get_evidence_count() -> int:
	return evidencelog.size()
func clear() -> void:
	evidencelog.clear()
#For Saving to disk

func save_inventory() -> void:
	var save_data = {
		"evidence": evidencelog.keys()
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if file == null:
		push_error("Could not open inventory save file.")
		return

	file.store_string(JSON.stringify(save_data, "\t"))
	file.close()#Open the save json file, write the evidence collected into it


func load_inventory(item_database: Dictionary) -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return#Me when I order a file that exists but it doesn't exist actually
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		push_error("Could not open inventory save file.")
		return

	var json = JSON.new()
	var error = json.parse(file.get_as_text())
	file.close()

	if error != OK:
		push_error("Failed to parse inventory save file.")
		return
	var save_data = json.data
	if not save_data is Dictionary:
		push_error("Invalid inventory save data.")
		return
	evidencelog.clear()
	for item_id in save_data.get("evidence", []):
		if item_database.has(item_id):
			add_item(item_database[item_id])
