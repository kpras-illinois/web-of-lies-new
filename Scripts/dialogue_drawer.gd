extends MarginContainer

const DialogueEntry = preload("res://Scenes/dialogue.tscn")

@onready var _dialogue_entries_container: Control = $PanelContainer/ScrollContainer/dialogue_entries

var csv_path_test : String = "res://csv/sheet.txt"

func next(loc: int) -> bool:
	var dialogue_data: Array[PackedStringArray] = load_csv_as_array(csv_path_test)
	print("CSV rows loaded: ", dialogue_data.size())
	if loc < 0 or loc >= dialogue_data.size():
		return false
	var entry = DialogueEntry.instantiate()
	_dialogue_entries_container.add_child(entry)
	entry.set_content(dialogue_data[loc][0], dialogue_data[loc][1])
	return true

func optional(loc:int) -> bool:
	var dialogue_data : Array[PackedStringArray] = load_csv_as_array(csv_path_test)
	
	if dialogue_data[loc][2] == "continue":
		return true
	else:
		return false

func _ready() -> void:
	pass

# Called when the node enters the scene tree for the first time.
"""func _ready() -> void:

	#creates an array of events to have the timeline process
	
	#loads csv into a 2D array [character, text]
	var dialogue_data : Array[PackedStringArray] = load_csv_as_array(csv_path_test)

	var start = DialogueEntry.instantiate()
	_dialogue_entries_container.add_child(start)
	start.set_content(dialogue_data[0][0], dialogue_data[0][1])"""

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func load_csv_as_array(csv_path: String) -> Array[PackedStringArray]:
	#Array from parsed csv file
	var _array2D : Array[PackedStringArray] = [];
	
	#Open CSV file and Read it
	var file = FileAccess.open(csv_path,FileAccess.READ)
	
	#file not loaded error handling
	if file == null:
		printerr("File not found",csv_path)
		return _array2D
		
	#Loop over file and append to array
	while not file.eof_reached():
		var line = file.get_csv_line()
		if(line.size() >= 2):
			_array2D.append(line)
		
	#close file
	file.close()
	
	return _array2D
	
