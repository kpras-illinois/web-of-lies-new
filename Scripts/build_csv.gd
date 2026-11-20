#csv file
"""var csv_path_test : String = "res://csv/Book 1 - Sheet1.csv"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	#creates an array of events to have the timeline process
	
	#loads csv into a 2D array [character, text]
	var dialogue_data : Array[PackedStringArray] = load_csv_as_array(csv_path_test)

	#iterates through the array
	for row in dialogue_data:
		var character_name = row[0]
		var character_text = row[1]



	


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
	"""
